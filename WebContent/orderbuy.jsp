<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*, java.util.ArrayList" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>订单</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<%
	User me = new User();
	me = (User)session.getAttribute("currentUser");
	String myname = me.getUsername();
	String myauth = me.getUserauth();
	
	DBConnect conn = new DBConnect();
	ArrayList<Order> orderlist = new ArrayList<Order>();
    orderlist = conn.getOrderBuy(myname);
    Order d = new Order();
    
    String donation = conn.getDonation();
%>

<div id="main_container">

	<div id="header">

        <div class="top_right" onselectstart="return false">
			<p>中 财 二 手 义 卖</p>        
        </div>
      
    </div>
    
   <div id="main_content"> 
    	<div id="menu_tab">
    	
        	<%@ include file="menu_tab.jsp" %>
        	
		</div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    导 航：<span class="current">订 单</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar">我的订单</div>
   	
   	<%
   	
   		for(int i = orderlist.size(); i > 0 ; i--){
    		
    		d = orderlist.get(i-1);
    		String itemname = conn.getItem(d.getorderitem()).getitemname();
    		String seller = d.getsellername();
    
    		out.println("<div class='prod_box_big'>");	
    		out.println("<div class='center_prod_box_big'>");
    		out.println("<div class='order_big_box'>");
    		out.println("<a href='item1.jsp?id=");
            out.println(d.getorderitem());
            out.println("' class='product_title_big'>");
            out.println(itemname);
            out.println("</a>");
    		out.println("<div class='specifications'>");     
    		out.println("卖家: <span class='blue'>");     
    		out.println(seller);
    		out.println("</span>数量: <span class='blue'>");            
    		out.println(d.getordercount());
    		out.println("</span>总价: <span class='blue'>￥ ");            
    		out.println(d.getordersum());
    		out.println("</span><br/>下单时间: <span class='blue'>");            
    		out.println(d.getordertime());
    		out.println("</span>");               	
    		out.println("<div class='prod_price_big'>订单状态：<span class='price'>");				
    		out.println(d.getordercond());				
    		out.println("</span></div></div></div>");
    		if(d.getordercond().equals("未付款")){
    			out.println("<a href='cancelOrder.jsp?id=");
                out.println(d.getorderid());
                out.println("' class='prod_favor'>取消订单</a>");
    			out.println("<a href='pay.jsp?id=");
                out.println(d.getorderid());
                out.println("' class='prod_details'>选择支付方式</a>");               
    		}else if(d.getordercond().equals("未发货")){    			
                out.println("<a href='cancelOrder.jsp?id=");
                out.println(d.getorderid());
                out.println("' class='prod_favor'>取消订单</a>");
                out.println("<a href='#' class='prod_details'>提醒卖家发货</a>");
    		}else if(d.getordercond().equals("已发货")){
    			out.println("<a href='confirmReceipt.jsp?id=");
                out.println(d.getorderid());
                out.println("' class='prod_details'>确认收货</a>");
    		}
    		else if(d.getordercond().equals("已收货")){
    			//out.println("<a href='comment.jsp?id=");
                //out.println(d.getorderid());
                //out.println("' class='prod_details'>评价商品</a>");
                //TODO:商品评价
    		}
    		                             
    		out.println("</div></div>");	
                              
   		}
   	
   %>
   
   </div><!-- end of center content -->

   <div class="right_content">
 
		<%@ include file="right_content.jsp" %>
        
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
        <p>中 财 二 手 义 卖. All Rights Reserved 2017</p>
   
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
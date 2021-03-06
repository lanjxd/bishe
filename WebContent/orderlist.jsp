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
<script type="text/javascript">  
    function confirmDelete(id){  
    	if(confirm("确认删除?")){  
        	window.location="cancelOrder.jsp?id="+id;
        }  
    }  
</script>
</head>
<body>

<%
	User me = new User();
	me = (User)session.getAttribute("currentUser");
	String myname = me.getUsername();
	String myauth = me.getUserauth();
	
	DBConnect conn = new DBConnect();
	ArrayList<Order> orderlist = new ArrayList<Order>();
    orderlist = conn.getAllOrder();
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
    	导 航：<span class="current">订 单 管 理</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   		<div class="center_title_bar">所 有 订 单</div>
   	
   	<%
   	
   		for(int i = orderlist.size(); i > 0 ; i--){
    		
    		d = orderlist.get(i-1);
    		String itemname = conn.getItem(d.getorderitem()).getitemname();
    		
    		String buyer = d.getbuyername();
    		User bu = new User();
    		bu = conn.saveUser(buyer);
    		String b_add = bu.getUseradd();
    		String b_phone = bu.getUserphone();
    		String b_mail = bu.getUsermail();
    		
    		String seller = d.getsellername();
    		User su = new User();
    		su = conn.saveUser(seller);
    		String s_phone = su.getUserphone();
    		String s_mail = su.getUsermail();
    
    		out.println("<div class='prod_box_big'>");	
    		out.println("<div class='center_prod_box_big'>");
    		out.println("<div class='order_big_box'>");
    		out.println("<a href='item1.jsp?id=");
            out.println(d.getorderitem());
            out.println("' class='product_title_big'>");
            out.println(itemname);
            out.println("</a>");
    		out.println("<div class='specifications'>");     
    		out.println("买 家: <span class='blue'><a href='javascript:alert(\"收货地址：");     
    		out.println(b_add);
    		out.println("\\n联系电话：");
    		out.println(b_phone);
    		out.println("\\n联系邮箱：");
    		out.println(b_mail);
    		out.println("\");' title='点击显示买家联系方式'>");     
    		out.println(buyer);
    		out.println("</a></span>卖 家: <span class='blue'><a href='javascript:alert(\"联系电话：");     
    		out.println(s_phone);
    		out.println("\\n联系邮箱：");
    		out.println(s_mail);
    		out.println("\");' title='点击显示卖家联系方式'>");     
    		out.println(seller);
    		out.println("</a></span><br/>数 量: <span class='blue'>");            
    		out.println(d.getordercount());
    		out.println("</span>总价: <span class='blue'>￥ ");            
    		out.println(d.getordersum());
    		out.println("</span><br/>下单时间: <span class='blue'>");            
    		out.println(d.getordertime());
    		out.println("</span>");
    		out.println("<div class='prod_price_big'>订单状态：<span class='price'>");
    		out.println(d.getordercond());
    		out.println("</span></div></div></div>");
    		if(d.getorderscore() != null){
    			out.println("<a href='comment.jsp?id=");
                out.println(d.getorderid());
                out.println("' class='prod_details'>查看评价</a>");
    		}
    		out.println("<a href='javascript:confirmDelete(");
            out.println(d.getorderid());
            out.println(")' class='prod_favor'>删除订单</a>");
    		out.println("</div></div>");
                              
   		}
   	
   %>
   
   </div><!-- end of center content -->

   <div class="right_content">
 
		<%@ include file="right_content1.jsp" %>
        
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
        <%@ include file="footer.jsp" %>
   
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
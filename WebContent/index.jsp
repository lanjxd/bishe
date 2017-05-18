<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*, java.util.ArrayList" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>中 财 二 手 义 卖</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<%
	DBConnect conn = new DBConnect();
	ArrayList<Item> itemlist = new ArrayList<Item>();
    itemlist = conn.getNewItem();
    Item i = new Item();
    
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
                    <ul class="menu">
                         <li><a href="index.jsp" class="nav">首 页</a></li>
                         <li class="divider"></li>
                         <li><a href="login.jsp" class="nav">登 录</a></li>
                         <li class="divider"></li>
                         <li><a href="register.jsp" class="nav">注 册</a></li>
                         <li class="divider"></li>
						 <li><a href="#" class="username">当前用户：游客</a></li>
                     </ul>

            </div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    	导 航：<span class="current">首 页</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content.jsp" %>
     
   </div><!-- end of left content --> 

   <div class="center_content">
    
   	<div class="center_title_bar">新 品 发 布</div>
    	<div style="height:400px;padding:50px 0;">
    <%
    
    	for(int j = 0; j < itemlist.size(); j++){
    		
    		i = itemlist.get(j);
    		
    		out.println("<div class='prod_box'>");
            out.println("<div class='center_prod_box'>");
            out.println("<div><a href='item.jsp?id=");
            out.println(i.getitemid());
            out.println("' title='");
            out.println(i.getitemname());
            out.println("' class='product_title'>");
            out.println(i.getitemname());
            out.println("</a></div>");
            out.println("<img src='");
            out.println(i.getitemimage());
            out.println("' class='product_img'/>");
            out.println("<div class='prod_price'><span class='price'>￥");
            out.println(i.getitemprice());
            out.println("</span></div></div></div>");
            
    	}
    
 	%>
 		</div>

 	<div class="center_title_bar">为 您 推 荐</div>
 	
 		<div style="font-size:16px;height:20px;padding:50px 0 30px 0;text-align:center;"><p>登录后,系统将根据您最近的购买记录为您推荐相似的商品</p></div>
       
   </div><!-- end of center content -->

   <div class="right_content">
 
		<%@ include file="right_content.jsp" %>
     
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
		<%@ include file="footer.jsp" %>
   
   </div>                 

</div>
<!-- end of main_container -->
</body>
</html>
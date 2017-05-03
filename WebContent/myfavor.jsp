<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*, java.util.ArrayList" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>收藏夹</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<%
	User me = new User();
	me = (User)session.getAttribute("currentUser");
	String myname = me.getUsername();
	String myauth = me.getUserauth();
	
	DBConnect conn = new DBConnect();
	ArrayList<Favor> favorlist = new ArrayList<Favor>();
    favorlist = conn.getMyfavor(myname);
    Favor f = new Favor();
    
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
    导 航：<span class="current">收 藏 夹</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar">我收藏的商品</div>
    
    	<%
    
    	for(int i = favorlist.size(); i > 0 ; i--){
    		
    		f = favorlist.get(i-1);
    		String itemname = conn.getItem(f.getfavoritem()).getitemname();
    		String itemseller = conn.getItem(f.getfavoritem()).getitemseller();
    		String itemprice = conn.getItem(f.getfavoritem()).getitemprice();
    		String itemimage = conn.getItem(f.getfavoritem()).getitemimage();
    		
    		out.println("<div class='prod_box'>");
            out.println("<div class='center_prod_box'>");
            out.println("<div class='product_title'>");
            out.println("<a href='item1.jsp?id=");
            out.println(f.getfavoritem());
            out.println("'>");
            out.println(itemname);
            out.println("</a></div>");
            out.println("<img src='");
            out.println(itemimage);
            out.println("' class='product_img'/>");
            out.println("<div class='specifications'>卖家: <span class='blue'>");
            out.println(itemseller);
            out.println("</span><br/>价格: <span class='blue'>￥");	
            out.println(itemprice);
            out.println("</span><br/>收藏时间: <span class='blue'>");	
            out.println(f.getfavortime());
            out.println("</span><br/></div>");	
            out.println("<a href='dealUnfavor.jsp?id=");
            out.println(f.getfavoritem());
            out.println("' class='prod_favor'>取消收藏</a>");
            out.println("</div>");
            out.println("</div>");
            
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
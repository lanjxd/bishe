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
	User me = new User();
	me = (User)session.getAttribute("currentUser");
	String myname = me.getUsername();
	String myauth = me.getUserauth();
	
	DBConnect conn = new DBConnect();
	ArrayList<Item> itemlist = new ArrayList<Item>();
	itemlist = conn.getMyitem(myname);
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
    	
        	<%@ include file="menu_tab.jsp" %>
			
		</div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    导 航：<span class="current">我 的 物 品</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
     
   </div><!-- end of left content --> 

   <div class="center_content">
    
   	<div class="center_title_bar">我 发 布 的 物 品</div>
    
    <%
    
    	for(int j = itemlist.size(); j > 0 ; j--){
    		
    		i = itemlist.get(j-1);
    		
    		out.println("<div class='prod_box'>");
            out.println("<div class='center_prod_box'>");
            out.println("<div class='product_title'>");
            out.println(i.getitemname());
            out.println("</div>");
            out.println("<img src='");
            out.println(i.getitemimage());
            out.println("' class='product_img'/>");
            out.println("<div class='prod_price'><span class='price'>￥");
            out.println(i.getitemprice());
            out.println("</span></div>");            
            out.println("<a href='deleteItem.jsp?id=");
            out.println(i.getitemid());
            out.println("' class='prod_favor'>删除此物品</a>");
            out.println("<a href='iteminfo.jsp?id=");
            out.println(i.getitemid());
            out.println("' class='prod_details'>更新物品信息</a>");
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
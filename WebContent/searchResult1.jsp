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
	String search = request.getParameter("search");
	if(search.equals("")){
		out.println("<script language='javascript'>alert('搜索内容不能为空！');window.location.replace(document.referrer);</script>");
	}
	itemlist = conn.getSearch(search);
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
    	导 航：<span class="current">搜 索</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
     
   </div><!-- end of left content --> 



   <div class="center_content">
    
   	<div class="center_title_bar">"<%=search %>" 的搜索结果</div>
    
    <%
    
    	for(int j = itemlist.size(); j > 0 ; j--){
    		
    		i = itemlist.get(j-1);
    		
    		out.println("<div class='prod_box'>");
            out.println("<div class='center_prod_box'>");
            out.println("<div><a href='item1.jsp?id=");
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
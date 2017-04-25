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
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String username = u.getUsername();
	
	DBConnect conn = new DBConnect();
	ArrayList<Item> itemlist = new ArrayList<Item>();
    itemlist = conn.getAllItem();
    Item i = new Item();
%>

<div id="main_container">

	<div id="header">

        <div class="top_right">
			<h1>中 财 二 手 义 卖</h1>        
        </div>
    
        <div id="logo">
            <!--<a href="index.jsp"><img src="images/logo.png" alt="" title="" border="0" width="200" height="100" /></a>-->
	    </div>
  
    </div>
    
   <div id="main_content"> 
   
            <div id="menu_tab">
                    <ul class="menu">
                         <li><a href="index1.jsp" class="nav">首 页</a></li>
                         <li class="divider"></li>
                         <li><a href="upload.jsp" class="nav">发 布 新 商 品</a></li>
                         <li class="divider"></li>
                         <li><a href="myorder.jsp" class="nav">我 的 订 单</a></li>
						 <li class="divider"></li>
                         <li><a href="myfavor.jsp" class="nav">收 藏 夹</a></li>
                         <li class="divider"></li>
                         <li><a href="myinfor.jsp" class="nav">个 人 信 息</a></li>
						 <li class="divider"></li>
                         <li><a href="index.jsp" class="nav">登 出</a></li>
						 <li class="divider"></li>
						 <li class="username"><%=username %></li>
                     </ul>

            </div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    导 航：<span class="current">首 页</span>
    </div>        
    
   <div class="left_content">
    <div class="title_box">分 类</div>
    
       <ul class="left_menu">
         <li class="odd"><a href="#">潮流女装</a></li>
        <li class="even"><a href="#">时尚男装</a></li>
         <li class="odd"><a href="#">羽绒服</a></li>
        <li class="even"><a href="#">秋季外套</a></li>
         <li class="odd"><a href="#">毛衣</a></li>
        <li class="even"><a href="#">秋裤</a></li>
         <li class="odd"><a href="#">长裤</a></li>
        <li class="even"><a href="#">短裤</a></li>
         <li class="odd"><a href="#">牛仔裤</a></li>
        <li class="even"><a href="#">连衣裙</a></li>
         <li class="odd"><a href="#">定制制服</a></li>
        <li class="even"><a href="#">修补服务</a></li>
        </ul> 
     
   </div><!-- end of left content --> 



   <div class="center_content">
    
   	<div class="center_title_bar">新 品 发 布</div>
    
    <%
    
    	for(int j = itemlist.size(); j > 0 ; j--){
    		
    		i = itemlist.get(j-1);
    		
    		out.println("<div class='prod_box'>");
            out.println("<div class='center_prod_box'>");
            out.println("<div class='product_title'>");
            out.println("<a href='item1.jsp?itemid=");
            out.println(j);
            out.println("'>");
            out.println(i.getitemname());
            out.println("</a></div>");
            out.println("<div class='product_img'><img src='images/p1.jpg' border='0'/></a></div>");
            out.println("<div class='prod_price'><span class='price'>￥");
            out.println(i.getitemprice());
            out.println("</span></div></div></div>");
            
    	}
    
 	%>
        
    	<div class="center_title_bar">为 您 推 荐</div>   
    	
    <%
    
    	
    
    %>
    
   </div><!-- end of center content -->

 <div class="right_content">
 
		<div class="title_box">商 品 搜 索</div><br/>		
		<form method="post" action="dealSearch.jsp">				  
			<input type="text" name="search"/>
			<br/><br/>
			<input type="submit" value="搜索"/>			
        </form>
   
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
        <p>中 财 二 手 义 卖. All Rights Reserved 2017</p>
   
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
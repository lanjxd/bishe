<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*" %>
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
	String userauth = u.getUserauth();
	
	DBConnect conn = new DBConnect(); 
	Item i = new Item();
	String id = request.getParameter("id");
	i = conn.getItem(id);
%>

<div id="main_container">

	<div id="header">

        <div class="top_right">
			<h1>中 财 二 手 义 卖</h1>        
        </div>
    
    </div>
    
   <div id="main_content"> 
    	<div id="menu_tab">
        	<ul class="menu">
            	<li><a href="index1.jsp" class="nav">首 页</a></li>
                <li class="divider"></li>
                         
		<%
                    
			if(userauth.equals("1")){
				out.println("<li><a href='orderbuy.jsp' class='nav'>我 的 订 单</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='myfavor.jsp' class='nav'>收 藏 夹</a></li>");								
			}else if(userauth.equals("2")){
				out.println("<li><a href='upload.jsp' class='nav'>发 布 新 商 品</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='myitem.jsp' class='nav'>我 的 商 品</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='ordersell.jsp' class='nav'>订 单 管 理</a></li>");
			}else{
				out.println("<li><a href='itemlist.jsp' class='nav'>商 品 管 理</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='userlist.jsp' class='nav'>用 户 管 理</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='orderlist.jsp' class='nav'>订 单 管 理</a></li>");
			}
                    
		%>
       
                <li class="divider"></li>
                <li><a href="index.jsp" class="nav">登 出</a></li>
				<li class="divider"></li>
				<li><a href="myinfor.jsp" class="username"><%=username %></a></li>
			</ul>
		</div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    导 航：<span class="current">修 改 物 品 信 息</span>
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
   
   	<div class="center_title_bar">更 新 物 品 信 息</div>
    
    	<div class="prod_box_big">
      
            <div class="center_prod_box_big">            
                 
                <form method="post" action="dealItemUpdate.jsp?id=<%=id %>" name="itemUpdateForm" class="contact_form">       
                    <div class="form_row">
                    <label><strong>名 称:</strong></label>
                    <input type="text" class="contact_input" name="i_name" value="<%=i.getitemname() %>" required="required"/>
                    </div>  

                    <div class="form_row">
                    <label><strong>类 型:</strong></label>
                    <input type="text" class="contact_input" name="i_cate" value="<%=i.getitemcate() %>" required="required"/>
                    </div>

                    <div class="form_row">
                    <label><strong>状 态:</strong></label>
                    <input type="text" class="contact_input" name="i_cond" value="<%=i.getitemcond() %>" required="required"/>
                    </div>
					
					<div class="form_row">
                    <label><strong>单 价:</strong></label>
                    <input type="text" class="contact_input" name="i_price" value="<%=i.getitemprice() %>" required="required"/>
                    </div>

					<div class="form_row">
                    <label><strong>数 量:</strong></label>
                    <input type="text" class="contact_input" name="i_count" value="<%=i.getitemcount() %>" required="required"/>
                    </div>

                    <div class="form_row">
                    <label><strong>描 述:</strong></label>
                    <textarea class="contact_textarea" name="i_info"><%=i.getiteminfo() %></textarea>
                    </div>

                    <div class="form_row">
                    <input type="submit" value="发布" class="prod_details"/>
                    </div>      
                </form>
                                    
            </div>
                                 
        </div>
    
   
   </div><!-- end of center content -->

<div class="right_content">
 
		<div class="title_box">商 品 搜 索</div><br/>		
		<form method="post" action="searchResult1.jsp">				  
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
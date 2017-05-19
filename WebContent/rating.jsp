<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>商品评价</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<%
	User me = new User();
	me = (User)session.getAttribute("currentUser");
	String myname = me.getUsername();
	String myauth = me.getUserauth();
	String id = request.getParameter("id");
	
	DBConnect conn = new DBConnect();
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
    	导 航：<span class="current">评 价</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar">您 的 评 分</div>
    
    	<div class="prod_box_big">

            <div class="center_prod_box_big">   
			
                <div class="contact_form">
                    
					<form method="post" action="dealRating.jsp?id=<%=id %>" name="ratingForm">
					
                    <div class="form_row">
                    <label><strong>综合评价:</strong></label>
                    <input type="radio" name="score" value="1" checked/>好评
                    <input type="radio" name="score" value="2"/>中评
                    <input type="radio" name="score" value="3"/>差评
                    </div>

                    <div class="form_row">
                    <label><strong>详细评价:</strong></label>
                    <textarea class="contact_textarea" name="comment"></textarea>
                    </div>
                    
                    <div class="form_row">
                    <input type="submit" value="提交评价"/>
                    </div>      
                    
					</form>
					
                </div> 
                               
            </div>
                              
        </div>
    
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
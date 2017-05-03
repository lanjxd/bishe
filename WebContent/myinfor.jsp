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
	User me = new User();
	me = (User)session.getAttribute("currentUser");
	String myname = me.getUsername();	
	String mypwd = me.getUserpwd();
	String mymail = me.getUsermail();
	String myphone = me.getUserphone();
	String myadd = me.getUseradd();
	String myauth = me.getUserauth();
	
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
    导 航：<span class="current">个 人 信 息</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
     
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar">修 改 个 人 信 息</div>
    
    	<div class="prod_box_big">
      
            <div class="center_prod_box_big">            

                <form method="post" action="dealUserUpdate.jsp" name="userUpdateForm" class="contact_form">       
                    <div class="form_row">
                    <label><strong>用户名:</strong></label>
                    <input type="text" class="contact_input" name="u_name" value="<%=myname %>" readonly="readonly"/>
                    </div> 
					
                    <div class="form_row">
                    <label><strong>密 码:</strong></label>
                    <input type="password" class="contact_input" name="u_pwd" value="<%=mypwd %>" required="required"/>
                    </div>

                    <div class="form_row">
                    <label><strong>电子邮箱:</strong></label>
                    <input type="text" class="contact_input" name="u_mail" value="<%=mymail %>"/>
                    </div>
					
					<div class="form_row">
                    <label><strong>联系电话:</strong></label>
                    <input type="text" class="contact_input" name="u_phone" value="<%=myphone %>"/>
                    </div>

                    <div class="form_row">
                    <label><strong>收货地址:</strong></label>
                    <textarea class="contact_textarea" name="u_add"><%=myadd %></textarea>
                    </div>

                    <div class="form_row">
                    <input type="submit" value="提交" class="prod_details"/>
                    </div>      
                </form>
             
            </div>
                                 
        </div>
    
   
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
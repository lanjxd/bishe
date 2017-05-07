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
                    <ul class="menu">
                         <li><a href="index.jsp" class="nav">首 页</a></li>
                         <li class="divider"></li>
                         <li><a href="login.jsp" class="nav">登 录</a></li>
                         <li class="divider"></li>
                         <li><a href="register.jsp" class="nav">注 册</a></li>
                     </ul>

            </div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    导 航：<span class="current">用 户 注 册</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content.jsp" %> 
     
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar">新 用 户 注 册</div>
    
    	<div class="prod_box_big">
      
            <div class="center_prod_box_big">            
                 
                <form method="post" action="dealRegister.jsp" name="registerForm" class="contact_form">       
                    <div class="form_row">
                    <label><strong>用户名:</strong></label>
                    <input type="text" class="contact_input" name="u_name" required="required"/>
                    </div>  

                    <div class="form_row">
                    <label><strong>密 码:</strong></label>
                    <input type="password" class="contact_input" name="u_pwd" required="required"/>
                    </div>
                  	
                  	<div class="form_row">
                    <label><strong>用户类型:</strong></label>
                    <select class="contact_input" name="u_auth" required="required">
					<option value="1">买 家</option>
					<option value="2">卖 家</option>
					</select>
                    </div>
                  	
                    <div class="form_row">
                    <label><strong>电子邮箱:</strong></label>
                    <input type="text" class="contact_input" name="u_mail"/>
                    </div>
					
					<div class="form_row">
                    <label><strong>联系电话:</strong></label>
                    <input type="text" class="contact_input" name="u_phone"/>
                    </div>

                    <div class="form_row">
                    <label><strong>收货地址:</strong></label>
                    <textarea class="contact_textarea" name="u_add"></textarea>
                    </div>

                    <div class="form_row">
                    <input type="submit" value="注 册"/>
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
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>结算</title>
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
    导 航：<span class="current">付 款</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar">选 择 支 付 方 式</div>
    
    	<div class="prod_box_big">

            <div class="center_prod_box_big">   
			
                <div class="contact_form">
                    
					<form>
					
                    <div class="form_row">
                    <input type="radio" name="pay" value="alipay" class="number_input" checked/>
					<label><strong>支 付 宝</strong></label>
                    </div> 
					
					<div class="form_row">
                    <input type="radio" name="pay" value="wechat" class="number_input" />
					<label><strong>微 信</strong></label>
                    </div>
					
                    <div class="form_row">
                    <input type="radio" name="pay" value="credit" class="number_input" />
					<label><strong>信 用 卡</strong></label>
                    </div>

                    <div class="form_row">
                    <input type="radio" name="pay" value="cod" class="number_input" />
					<label><strong>货 到 付 款</strong></label>
                    </div>
                    
                    <div class="form_row">
                    <a href="dealPay.jsp?id=<%=id %>" class="prod_buy">支 付</a>
                    </div>      
                    
					</form>
					
                </div> 
                               
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
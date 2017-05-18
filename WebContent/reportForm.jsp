<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>意见反馈表</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div class="prod_box_big">
    <div class="center_prod_box_big">
	<form method="post" action="" name="uploadForm" class="contact_form">       
    	<div class="form_row">
    	<label><strong>标 题:</strong></label>
    	<input type="text" class="contact_input" name="i_title" required="required"/>
    	</div>
    	<div class="form_row">
        <label><strong>内 容:</strong></label>
        <textarea class="contact_textarea" name="i_text"></textarea>
        </div>
        <div class="form_row">
        <input type="submit" value="提交" onclick="alert('感谢您的宝贵建议！');window.close();"/>
        </div>      
	</form>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" import="DAO.*" pageEncoding="utf-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
</head>
<body>
<%	
	String username = request.getParameter("u_name");
	String userpwd = request.getParameter("u_pwd");
	String usermail = request.getParameter("u_mail");	
	String userphone = request.getParameter("u_phone");
	String useradd = request.getParameter("u_add");
	String userauth = request.getParameter("u_auth");
	
	DBConnect conn = new DBConnect();
	
	if(conn.isUserExist(username)){
		out.println("<script language='javascript'>alert('该用户名已存在！');window.location.replace(document.referrer);</script>");
	}
	else {
	conn.newUser(username, userpwd, usermail, userphone, useradd, userauth);	
	out.println("<script language='javascript'>alert('注册成功！请登录！');window.location.href='login.jsp';</script>");
	}
%>
</body>
</html>
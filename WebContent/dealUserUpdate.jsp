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
	String usernick = request.getParameter("u_nick");	
	String usermail = request.getParameter("u_mail");	
	String userphone = request.getParameter("u_phone");
	String useradd = request.getParameter("u_add");
		
	DBConnect conn = new DBConnect();

	conn.alterUserInfo(username, userpwd, usernick, usermail, userphone, useradd);
	
	out.println("<script language='javascript'>alert('用户信息修改成功！请重新登录！');window.location.href='login.jsp';</script>");
%>
</body>
</html>
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
	String username = request.getParameter("username");
	
	DBConnect conn = new DBConnect();	
	conn.deleteUser(username);	
	out.println("<script language='javascript'>alert('用户已删除！');window.location.replace(document.referrer);</script>");
%>
</body>
</html>
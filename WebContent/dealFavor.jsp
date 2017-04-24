<%@ page language="java" contentType="text/html; charset=utf-8" import="DAO.*, java.util.Date" pageEncoding="utf-8"%>
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
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String favoruser = u.getUsername();
	String favoritem = request.getParameter("id");
	
	DBConnect conn = new DBConnect();	
	conn.favor(favoruser, favoritem);	
	out.println("<script language='javascript'>alert('收藏成功！');window.location.href = document.referrer;</script>");
%>
</body>
</html>
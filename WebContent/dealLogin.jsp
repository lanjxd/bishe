<%@page language="java" contentType="text/html; charset=utf-8" import="DAO.*" pageEncoding="utf-8"%>
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
	String username=request.getParameter("u_name");
	String userpwd=request.getParameter("u_pwd");
	
	DBConnect conn = new DBConnect();
	boolean isUser = conn.chkUser(username, userpwd);
	
	if(isUser){
		User currentUser = new User();
		currentUser = conn.saveUser(username);
		session.setAttribute("currentUser", currentUser);
		response.sendRedirect("index1.jsp");
	}
	else {
		out.println("<script language='javascript'>alert('用户名或密码错误，请重新输入！');window.location.replace(document.referrer);</script>");
	}
%>
</body>
</html>
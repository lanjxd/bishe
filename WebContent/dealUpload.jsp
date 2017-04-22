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
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String username = u.getUsername();
	
	String itemname = request.getParameter("i_name");
	String itemcate = request.getParameter("i_cate");
	String itemcond = request.getParameter("i_cond");
	String itemprice = request.getParameter("i_price");
	String itemcount = request.getParameter("i_count");
	String iteminfo = request.getParameter("i_info");
	
	DBConnect conn = new DBConnect();
	
	conn.uploadItem(itemname, itemcate, itemcond, itemprice, itemcount, iteminfo, username);	
	out.println("<script language='javascript'>alert('发布成功！');window.location.href='index1.jsp';</script>");
%>
</body>
</html>
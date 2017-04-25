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
	String orderid = request.getParameter("id");
	
	DBConnect conn = new DBConnect();	
	conn.cancelOrder(orderid);	
	out.println("<script language='javascript'>alert('已取消订单！');window.location.replace(document.referrer);</script>");
%>
</body>
</html>
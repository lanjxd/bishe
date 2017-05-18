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
	conn.applyReturn(orderid);
	out.println("<script language='javascript'>alert('退货申请已提交！');window.location.href='orderbuy.jsp';</script>");
%>
</body>
</html>
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
	String orderscore = request.getParameter("score");
	String ordercomment = request.getParameter("comment");
	
	DBConnect conn = new DBConnect();	
	conn.rateOrder(orderid, orderscore, ordercomment);	
	out.println("<script language='javascript'>alert('订单评价成功！');window.location.href='orderbuy.jsp';</script>");
%>
</body>
</html>
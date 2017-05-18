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
	Order d = conn.getOrder(orderid);
	String ordercount = d.getordercount();
	String orderitem = d.getorderitem();
	String ordercond = d.getordercond();
	conn.confirmReturn(orderid, ordercount, orderitem);
	out.println("<script language='javascript'>alert('退货成功！');window.location.href='ordersell.jsp';</script>");
%>
</body>
</html>
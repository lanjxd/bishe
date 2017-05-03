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
	if(ordercond.equals("已收货")){
		conn.deleteOrder(orderid);	
		out.println("<script language='javascript'>alert('已删除订单！');window.location.replace(document.referrer);</script>");
	}else{
		conn.cancelOrder(orderid, ordercount, orderitem);	
		out.println("<script language='javascript'>alert('已取消订单！');window.location.replace(document.referrer);</script>");
	}
%>
</body>
</html>
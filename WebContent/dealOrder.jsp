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
	String buyername = u.getUsername();

	DBConnect conn = new DBConnect(); 
	Item i = new Item();
	String orderitem = request.getParameter("id");
	i = conn.getItem(orderitem);
	String sellername = i.getitemseller();
	String ordercount = request.getParameter("buynumber");
	String itemprice = i.getitemprice();
	String ordersum = String.valueOf((Double.valueOf(ordercount) * Double.valueOf(itemprice)));
	String ordercond = "未付款";
	
	conn.newOrder(orderitem, buyername, sellername, ordercount, ordersum, ordercond);	
	out.println("<script language='javascript'>window.location.href='myorder.jsp';</script>");

%>
</body>
</html>
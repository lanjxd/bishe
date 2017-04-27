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
	String itemname = request.getParameter("i_name");
	String itemcate = request.getParameter("i_cate");
	String itemcond = request.getParameter("i_cond");
	String itemprice = request.getParameter("i_price");
	String itemcount = request.getParameter("i_count");
	String iteminfo = request.getParameter("i_info");
	String itemid = request.getParameter("id");
		
	DBConnect conn = new DBConnect();

	conn.alterItemInfo(itemname, itemcate, itemcond, itemprice, itemcount, iteminfo, itemid);
	
	out.println("<script language='javascript'>alert('物品信息修改成功！');window.location.href='myitem.jsp';</script>");
%>
</body>
</html>
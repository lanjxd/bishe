<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*, DAO.*, java.util.*" pageEncoding="utf-8"%>
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
	
	Cart c = (Cart)session.getAttribute("cart");
	List<CartItem> items = c.getItems();
	for(Iterator<CartItem> it = items.iterator(); it.hasNext();){  
    	CartItem ci = it.next();
		i = ci.getItem();
		String itemcount = i.getitemcount();
		int ic = Integer.valueOf(itemcount);
		int oc = ci.getCount();
		if(oc == 0){
			out.println("<script language='javascript'>alert('订单中物品数量不能为0！');window.location.replace(document.referrer);</script>");
		}else if(ic < oc){
			out.println("<script language='javascript'>alert('订单中物品数量超出物品库存！');window.location.replace(document.referrer);</script>");
		}else{
			String orderitem = i.getitemid();
			String sellername = i.getitemseller();	
			String itemprice = i.getitemprice();
			String ordercount = Integer.toString(oc);
			String ordersum = String.valueOf((Double.valueOf(ordercount) * Double.valueOf(itemprice)));
			String ordercond = "未付款";
			conn.newOrder(orderitem, buyername, sellername, ordercount, ordersum, ordercond);
			it.remove();
		}
	}
	out.println("<script language='javascript'>window.location.href='orderbuy.jsp';</script>");
%>
</body>
</html>
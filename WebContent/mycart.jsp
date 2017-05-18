<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*, java.util.*" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 

User me = new User();
me = (User)session.getAttribute("currentUser");
String myname = me.getUsername();
String myauth = me.getUserauth();

DBConnect conn = new DBConnect();
Item i =new Item();
String donation = conn.getDonation();

Cart c = (Cart)session.getAttribute("cart");  
if(c == null) {  
    c = new Cart();  
    session.setAttribute("cart", c);  
}  
  
double totalPrice = c.getTotalPrice();  
  
String action = request.getParameter("action");  
  
if(action != null && action.trim().equals("add")) {  
    String id = request.getParameter("id");  
    i = conn.getItem(id);  
    CartItem ci = new CartItem();  
    ci.setItem(i);  
    ci.setCount(1);  
    c.add2Cart(ci);  
}  
  
if(action != null && action.trim().equals("delete")) {  
    String id = request.getParameter("id");  
    c.deleteItemById(id);  
}  
  
if(action != null && action.trim().equals("update")) {  
    for(int x = 0; x < c.getItems().size(); x++) {  
        CartItem ci = c.getItems().get(x);  
        int count = Integer.parseInt(request.getParameter("i" + ci.getItem().getitemid()));  
        ci.setCount(count);  
    }  
}

if(action != null && action.trim().equals("clear")) {   
    c.clearCart(); 
}
%>

<%
List<CartItem> items = c.getItems();
%>

<html>
<head>
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<div id="main_container">

	<div id="header">

        <div class="top_right" onselectstart="return false">
			<p>中 财 二 手 义 卖</p>        
        </div>
    
    </div>
    
   <div id="main_content"> 
    	<div id="menu_tab">
    	
        	<%@ include file="menu_tab.jsp" %>
        	
		</div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    	导 航：<span class="current">购 物 车</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar">我的购物车</div>
   	
   		<form action="mycart.jsp" method="get">  
			<input type="hidden" name="action" value="update"/>  
			<table class="cart_table">
			<tr class="form_row">   
        		<td>名称</td>  
        		<td>数量</td>  
        		<td>单价</td>  
        		<td>总价</td>  
        		<td>操作</td>  
    		</tr>
    
    	<%
    		for(Iterator<CartItem> it = items.iterator(); it.hasNext();) {  
            	CartItem ci = it.next();  
        %>
          
            <tr class="cart_row">  
                <td><%=ci.getItem().getitemname() %></td>  
                <td>  
                    <input type="text" size=1 name="<%="i" + ci.getItem().getitemid() %>" value="<%=ci.getCount() %>"   
                        onkeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;"  
                        onchange="document.forms[0].submit()">
                </td>
                <td><%=ci.getItem().getitemprice() %></td>  
                <td><%=Double.parseDouble(ci.getItem().getitemprice())*ci.getCount() %></td>  
                <td width=75px><a href="mycart.jsp?action=delete&id=<%=ci.getItem().getitemid() %>" class="prod_favor">删除</a></td>  
            </tr>
              
        <%  
        	}  
 		%>
 			
 			<tr>  
        		<td colspan=2 align="right"><span class="blue">购物车物品总价：</span></td>
        		<td></td>  
        		<td colspan=2 align="left"><span class="price">￥<%=c.getTotalPrice() %></span></td>  
    		</tr>
    		<tr>  
    			<td>  
             		<a href="mycart.jsp?action=clear" class="prod_favor">清空购物车</a>   
        		</td>
        		<td colspan=3></td>  
        		<td>  
            		<a href="dealOrder.jsp" class="prod_buy">创建订单</a>
        		</td>  
    		</tr>  
 			</table>  
		</form>  
    
   </div><!-- end of center content -->

   <div class="right_content">
 
		<%@ include file="right_content1.jsp" %>
        
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
        <p>中 财 二 手 义 卖. All Rights Reserved 2017</p>
   
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
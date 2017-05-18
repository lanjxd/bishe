<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>商品详情</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script>
function confirmUnfavor(id){  
	if(confirm("确认取消收藏?")){  
    	window.location="dealUnfavor.jsp?id="+id;
    }
}

function confirmDelete(id){  
	if(confirm("确认删除?")){  
    	window.location="deleteItem.jsp?id="+id;
    }
}
</script>
</head>

<body>

<%
	User me = new User();
	me = (User)session.getAttribute("currentUser");
	String myname = me.getUsername();
	String myauth = me.getUserauth();
	
	DBConnect conn = new DBConnect(); 
	Item i = new Item();
	String id = request.getParameter("id");
	i = conn.getItem(id);
	boolean favored = conn.chkFavor(myname, id);
	
	String donation = conn.getDonation();
	
	String itemcate = i.getitemcate();
	int cate = Integer.parseInt(itemcate);
	switch(cate){
	case 1:itemcate = "图书教辅";break;
	case 2:itemcate = "数码产品";break;
	case 3:itemcate = "办公文具";break;
	case 4:itemcate = "体育器材";break;
	case 5:itemcate = "生活用品";break;
	case 6:itemcate = "手工艺品";break;
	case 7:itemcate = "男 装";break;
	case 8:itemcate = "女 装";break;
	case 9:itemcate = "其 它";break;
	}
%>

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
    	导 航：<span class="current">商 品 详 情</span>
    </div>        
    
   <div class="left_content">
   
   		<%@ include file="left_content1.jsp" %>
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar"><%=i.getitemname() %></div>
    
    	<div class="prod_box_big">

            <div class="center_prod_box_big">            
                 
                 <div>
                 	<a href="<%=i.getitemimage() %>" target="_blank" title="查看大图">
                 		<img src="<%=i.getitemimage() %>" class="product_img_big"/>
                 	</a>
                 </div>
                 <div class="details_big_box">
                 	 
                         <div class="product_title_big"><%=i.getitemname() %></div>
                         <div class="specifications">
							卖家: <span class="blue"><%=i.getitemseller() %></span><br/>
							
							库存: 
							<% 
								if(i.getitemcount().equals("0")){
									out.println("<span class='red'>");
									out.println("售罄");									
								}else{
									out.println("<span class='blue'>");
									out.println(i.getitemcount());
								}
						
							%></span><br/>
							
							成色: <span class="blue"><%=i.getitemcond() %></span><br/>
                            
							分类: <span class="blue"><%=itemcate %></span><br/>
                         </div>
                         <div class="prod_price_big">单价：<span class="price">￥ <%=i.getitemprice() %></span></div>
						 <br/>
						 
					 <%	 
						 if(myauth.equals("1")){
						 	out.println("<a href='mycart.jsp?id=");
						 	out.println(id);
						 	out.println("&action=add' class='prod_buy'>添加到购物车</a>");
                         	
                         	if(favored){
                         		out.println("<a href='javascript:confirmUnfavor(");
                             	out.println(id);
                             	out.println(")' class='prod_favor'>取消收藏</a>");		 
                         	}
                         	else{
                             	out.println("<a href='dealFavor.jsp?id=");
                             	out.println(id);
                             	out.println("' class='prod_favor'>收 藏</a>");
                         	}
                         	out.println("</form>");
                         }else if(myauth.equals("0")||i.getitemseller().equals(myname)){
                        	 out.println("<a href='javascript:confirmDelete(");
                             out.println(id);
                             out.println(")' class='prod_favor'>删除此物品</a>");
                             out.println("<a href='iteminfo.jsp?id=");
                             out.println(id);
                             out.println("' class='prod_details'>更新物品信息</a>");
                         }
                     %>
                         
                 </div>
                 <div class="prod_info">
                 	<span class="info_title">物品详情</span>
                 	<br/>
                 	<span class="info_main"><%=i.getiteminfo() %></span>
                 </div>                         
            </div>
                              
        </div>
    
   </div><!-- end of center content -->

   <div class="right_content">
 
		<%@ include file="right_content1.jsp" %>
        
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
        <%@ include file="footer.jsp" %>
   
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
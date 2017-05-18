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
</head>

<body>

<%
	DBConnect conn = new DBConnect(); 
	Item i = new Item();
	i = conn.getItem(request.getParameter("id"));
	
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
                    <ul class="menu">
                         <li><a href="index.jsp" class="nav">首 页</a></li>
                         <li class="divider"></li>
                         <li><a href="login.jsp" class="nav">登 录</a></li>
                         <li class="divider"></li>
                         <li><a href="register.jsp" class="nav">注 册</a></li>
                         <li class="divider"></li>
						 <li><a href="#" class="username">当前用户：游客</a></li>
                     </ul>

            </div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    	导 航：<span class="current">商 品 详 情</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content.jsp" %> 
    
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
							
						库存: <span class="blue">
						<% 
							if(i.getitemcount().equals("0")){
								out.println("售罄");
							}else{
								out.println(i.getitemcount());
							}
						
						%></span><br/>
							
						成色: <span class="blue"><%=i.getitemcond() %></span><br/>
                            
						分类: <span class="blue"><%=itemcate %></span><br/>
                    </div>
                    <div class="prod_price_big">单价：<span class="price">￥ <%=i.getitemprice() %></span></div>
                    <br/><br/>
                    <a href="login.jsp" class="prod_buy" onclick="alert('游客请先登录！')">购 买</a>
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
 
		<%@ include file="right_content.jsp" %>
        
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
        <%@ include file="footer.jsp" %>
   
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
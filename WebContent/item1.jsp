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

<script type="text/javascript" src="js/boxOver.js"></script>
<script>
PositionX = 100;
PositionY = 100;


defaultWidth  = 500;
defaultHeight = 500;
var AutoClose = true;

if (parseInt(navigator.appVersion.charAt(0))>=4){
var isNN=(navigator.appName=="Netscape")?1:0;
var isIE=(navigator.appName.indexOf("Microsoft")!=-1)?1:0;}
var optNN='scrollbars=no,width='+defaultWidth+',height='+defaultHeight+',left='+PositionX+',top='+PositionY;
var optIE='scrollbars=no,width=150,height=100,left='+PositionX+',top='+PositionY;
function popImage(imageURL,imageTitle){
if (isNN){imgWin=window.open('about:blank','',optNN);}
if (isIE){imgWin=window.open('about:blank','',optIE);}
with (imgWin.document){
writeln('<html><head><title>Loading...</title><style>body{margin:0px;}</style>');writeln('<sc'+'ript>');
writeln('var isNN,isIE;');writeln('if (parseInt(navigator.appVersion.charAt(0))>=4){');
writeln('isNN=(navigator.appName=="Netscape")?1:0;');writeln('isIE=(navigator.appName.indexOf("Microsoft")!=-1)?1:0;}');
writeln('function reSizeToImage(){');writeln('if (isIE){');writeln('window.resizeTo(300,300);');
writeln('width=300-(document.body.clientWidth-document.images[0].width);');
writeln('height=300-(document.body.clientHeight-document.images[0].height);');
writeln('window.resizeTo(width,height);}');writeln('if (isNN){');       
writeln('window.innerWidth=document.images["George"].width;');writeln('window.innerHeight=document.images["George"].height;}}');
writeln('function doTitle(){document.title="'+imageTitle+'";}');writeln('</sc'+'ript>');
if (!AutoClose) writeln('</head><body bgcolor=ffffff scroll="no" onload="reSizeToImage();doTitle();self.focus()">')
else writeln('</head><body bgcolor=ffffff scroll="no" onload="reSizeToImage();doTitle();self.focus()" onblur="self.close()">');
writeln('<img name="George" src='+imageURL+' style="display:block"></body></html>');
close();		
}}
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
            	<li><a href="index1.jsp" class="nav">首 页</a></li>
                <li class="divider"></li>
                         
		<%
                    
			if(myauth.equals("1")){
				out.println("<li><a href='orderbuy.jsp' class='nav'>我 的 订 单</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='myfavor.jsp' class='nav'>收 藏 夹</a></li>");								
			}else if(myauth.equals("2")){
				out.println("<li><a href='upload.jsp' class='nav'>发 布 新 商 品</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='myitem.jsp' class='nav'>我 的 商 品</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='ordersell.jsp' class='nav'>订 单 管 理</a></li>");
			}else{
				out.println("<li><a href='itemlist.jsp' class='nav'>商 品 管 理</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='userlist.jsp' class='nav'>用 户 管 理</a></li>");
				out.println("<li class='divider'></li>");
				out.println("<li><a href='orderlist.jsp' class='nav'>订 单 管 理</a></li>");
			}
                    
		%>
       
                <li class="divider"></li>
                <li><a href="index.jsp" class="nav">登 出</a></li>
				<li class="divider"></li>
				<li><a href="myinfor.jsp" class="username"><%=myname %></a></li>
			</ul>
		</div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    导 航：<span class="current">商 品 详 情</span>
    </div>        
    
   <div class="left_content">
    <div class="title_box">分 类</div>
    
       <ul class="left_menu">
         <li class="odd"><a href="category1.jsp?id=1">图书教辅</a></li>
        <li class="even"><a href="category1.jsp?id=2">数码产品</a></li>
         <li class="odd"><a href="category1.jsp?id=3">办公文具</a></li>
        <li class="even"><a href="category1.jsp?id=4">体育器材</a></li>
         <li class="odd"><a href="category1.jsp?id=5">生活用品</a></li>
        <li class="even"><a href="category1.jsp?id=6">手工艺品</a></li>
         <li class="odd"><a href="category1.jsp?id=7">男 装</a></li>
        <li class="even"><a href="category1.jsp?id=8">女 装</a></li>
         <li class="odd"><a href="category1.jsp?id=9">其 它</a></li>        
       </ul>
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar"><%=i.getitemname() %></div>
    
    	<div class="prod_box_big">

            <div class="center_prod_box_big">            
                 
                 <div>
                 	<a href="javascript:popImage('<%=i.getitemimage() %>')" title="header=[查看大图] body=[&nbsp;] fade=[on]">
                 		<img src="<%=i.getitemimage() %>" class="product_img_big"/>
                 	</a>
                </div>
                 <div class="details_big_box">
                 	 
                         <div class="product_title_big"><%=i.getitemname() %></div>
                         <div class="specifications">
							卖家: <span class="blue"><%=i.getitemseller() %></span><br/>
							
							库存: <span class="blue"><%=i.getitemcount() %></span><br/>
							
							成色: <span class="blue"><%=i.getitemcond() %></span><br/>
                            
							分类: <span class="blue"><%=itemcate %></span><br/>
                         </div>
                         <div class="prod_price_big">单价：<span class="price">￥ <%=i.getitemprice() %></span></div>
						 <br/>
						 
					 <%	 
						 if(myauth.equals("1")){
						 	out.println("<form method='post' action='dealOrder.jsp?id=");
						 	out.println(id);
						 	out.println("' name='orderForm'>"); 
						 	out.println("<label>数量: </label>");                        
						 	out.println("<input type='text' name='buynumber' class='number_input' value='1' onkeyup=\"value=value.replace(/[^\\d.]/g,\'\')\"/>");
						 	out.println("<br/><br/>");
						 	out.println("<input type='submit' value='买买买'/>");
                         	
                         	if(favored){
                        	 	out.println("<a href='dealUnfavor.jsp?id=");
                             	out.println(id);
                             	out.println("' class='prod_favor'>取消收藏</a>");		 
                         	}
                         	else{
                             	out.println("<a href='dealFavor.jsp?id=");
                             	out.println(id);
                             	out.println("' class='prod_favor'>收 藏</a>");
                         	}
                         	out.println("</form>");
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
 
		<div class="title_box">商 品 搜 索</div><br/>		
		<form method="post" action="searchResult1.jsp">				  
			<input type="text" name="search"/>
			<br/><br/>
			<input type="submit" value="搜索"/>			
        </form>
        
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
        <p>中 财 二 手 义 卖. All Rights Reserved 2017</p>
   
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
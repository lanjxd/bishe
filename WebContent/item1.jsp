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
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String username = u.getUsername();
	
	DBConnect conn = new DBConnect(); 
	Item i = new Item();
	String id = request.getParameter("itemid");
	i = conn.getItem(id);
	boolean favored = conn.chkFavor(username, id);
%>

<div id="main_container">

	<div id="header">

        <div class="top_right">
			<h1>中 财 二 手 义 卖</h1>        
        </div>
    
        <div id="logo">
            <!--<a href="index.jsp"><img src="images/logo.png" alt="" title="" border="0" width="200" height="100" /></a>-->
	    </div>
  
    </div>
    
   <div id="main_content"> 
   
            <div id="menu_tab">
                    <ul class="menu">
                         <li><a href="index1.jsp" class="nav">首 页</a></li>
                         <li class="divider"></li>
                         <li><a href="upload.jsp" class="nav">发 布 新 商 品</a></li>
                         <li class="divider"></li>
                         <li><a href="myorder.jsp" class="nav">我 的 订 单</a></li>
						 <li class="divider"></li>
                         <li><a href="myfavor.jsp" class="nav">收 藏 夹</a></li>
                         <li class="divider"></li>
                         <li><a href="myinfor.jsp" class="nav">个 人 信 息</a></li>
						 <li class="divider"></li>
                         <li><a href="index.jsp" class="nav">登 出</a></li>
						 <li class="divider"></li>
						 <li class="username"><%=username %></li>
                     </ul>

            </div><!-- end of menu tab -->
            
    <div class="crumb_navigation">
    导 航：<span class="current">商 品 详 情</span>
    </div>        
    
   <div class="left_content">
    <div class="title_box">分 类</div>
    
       <ul class="left_menu">
         <li class="odd"><a href="#">潮流女装</a></li>
        <li class="even"><a href="#">时尚男装</a></li>
         <li class="odd"><a href="#">羽绒服</a></li>
        <li class="even"><a href="#">秋季外套</a></li>
         <li class="odd"><a href="#">毛衣</a></li>
        <li class="even"><a href="#">秋裤</a></li>
         <li class="odd"><a href="#">长裤</a></li>
        <li class="even"><a href="#">短裤</a></li>
         <li class="odd"><a href="#">牛仔裤</a></li>
        <li class="even"><a href="#">连衣裙</a></li>
         <li class="odd"><a href="#">定制制服</a></li>
        <li class="even"><a href="#">修补服务</a></li>
        </ul> 
    
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar"><%=i.getitemname() %></div>
    
    	<div class="prod_box_big">

            <div class="center_prod_box_big">            
                 
                 <div class="product_img_big">
                 <a href="javascript:popImage('images/p1.jpg')" title="header=[Zoom] body=[&nbsp;] fade=[on]"><img src="images/p1.jpg" alt="" title="" border="0" /></a>
                 
                 </div>
                 <div class="details_big_box">
                 	 <form method="post" action="dealOrder.jsp?id=<%=id %>" name="orderForm">
                         <div class="product_title_big"><%=i.getitemname() %></div>
                         <div class="specifications">
							卖家: <span class="blue"><%=i.getitemseller() %></span><br/>
							
							库存: <span class="blue"><%=i.getitemcount() %></span><br/>
							
							成色: <span class="blue"><%=i.getitemcond() %></span><br/>
                            
							 商品描述: <span class="blue"><%=i.getiteminfo() %></span><br/>
                         </div>
                         <div class="prod_price_big">单价：<span class="price">￥ <%=i.getitemprice() %></span></div>
						 <br/><br/>
                         <label>数量: </label>
						 <input type="text" name="buynumber" class="number_input" value="1"/>
						 <br/><br/>
                         <input type="submit" value="买买买"/>
                         
                     <%
                         if(favored){
                        	 out.println("<a href='dealUnfavor.jsp?id=");
                             out.println(id);
                             out.println("'>取消收藏</a>");		 
                         }
                         else{
                             out.println("<a href='dealFavor.jsp?id=");
                             out.println(id);
                             out.println("'>收 藏</a>");
                         }
                     %>
                     </form>    
                 </div>                        
            </div>
                              
        </div>
    
   </div><!-- end of center content -->

 <div class="right_content">
 
		<div class="title_box">商 品 搜 索</div><br/>		
		<form method="post" action="dealSearch.jsp">				  
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
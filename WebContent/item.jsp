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
                 	<a href="javascript:popImage('<%=i.getitemimage() %>')" title="header=[查看大图] body=[&nbsp;] fade=[on]">
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
					<br/>
                    <label>数量: </label>
					<input type="text" name="number" class="number_input" value="1" onkeyup="value=value.replace(/[^\d.]/g,'')"/>
					<br/><br/>
                    <a href="login.jsp" class="prod_buy">买买买</a>
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
   
        <p>中 财 二 手 义 卖. All Rights Reserved 2017</p>
   
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
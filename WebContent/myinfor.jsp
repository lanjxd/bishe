<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>中财二手服装交易网</title>
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
	String userpwd = u.getUserpwd();
	String usernick = u.getUsernick();
	String usermail = u.getUsermail();
	String userphone = u.getUserphone();
	String useradd = u.getUseradd();
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
    导 航：<span class="current">个 人 信 息</span>
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
   
   	<div class="center_title_bar">修 改 个 人 信 息</div>
    
    	<div class="prod_box_big">
      
            <div class="center_prod_box_big">            
                 
              	<div class="contact_form">
                    <form method="post" action="dealUserUpdate.jsp" name="userUpdateForm">       
                    <div class="form_row">
                    <label><strong>用户名:</strong></label>
                    <input type="text" class="contact_input" name="u_name" value="<%=username %>" readonly="readonly"/>
                    </div> 
					
                    <div class="form_row">
                    <label><strong>密 码:</strong></label>
                    <input type="password" class="contact_input" name="u_pwd" value="<%=userpwd %>"/>
                    </div>


                    <div class="form_row">
                    <label><strong>昵称:</strong></label>
                    <input type="text" class="contact_input" name="u_nick" value="<%=usernick %>"/>
                    </div>
                    
                    <div class="form_row">
                    <label><strong>电子邮箱:</strong></label>
                    <input type="text" class="contact_input" name="u_mail" value="<%=usermail %>"/>
                    </div>
					
					<div class="form_row">
                    <label><strong>联系电话:</strong></label>
                    <input type="text" class="contact_input" name="u_phone" value="<%=userphone %>"/>
                    </div>

                    <div class="form_row">
                    <label><strong>收货地址:</strong></label>
                    <textarea class="contact_textarea" name="u_add" value="<%=useradd %>"></textarea>
                    </div>

                    <div class="form_row">
                    <input type="submit" value="提交" class="prod_details"/>
                    </div>      
                    </form>
                </div> 
                                    
            </div>
                                 
        </div>
    
   
   </div><!-- end of center content -->

<div class="right_content">
 
		<div class="title_box">商 品 搜 索</div>  
		<input type="text" name="search" class="search_input" value=""/>
		<a href="search.jsp" class="prod_details">搜 索</a>
        <br/><br/> 
     
   		<div class="shopping_cart">
        	<div class="title_box">购 物 车</div>
            
            <div class="cart_details">
            <br/>
            <span class="border_cart"></span>
            总 价:<span class="price">￥ 0</span>
            </div>
            
            <div class="cart_icon"><a href="#" title=""><img src="images/shoppingcart.png" alt="" title="" width="35" height="35" border="0" /></a></div>
        
        </div>
   
   </div><!-- end of right content -->   
        
   </div><!-- end of main content -->
   
   <div class="footer">
   
        <p>中财二手服装交易网. All Rights Reserved 2017</p>
   
   </div>                 

</div>
<!-- end of main_container -->
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>

<html>
<head>
<title>中财二手服装交易网</title>
<link rel="stylesheet" type="text/css" href="style.css" />

<script type="text/javascript" src="js/boxOver.js"></script>
</head>
<body>

<div id="main_container">

	<div id="header">

        <div class="top_right">
			<h1>中 财 二 手 服 装 交 易 网</h1>        
        </div>
    
        <div id="logo">
            <!--<a href="index.jsp"><img src="images/logo.png" alt="" title="" border="0" width="200" height="100" /></a>-->
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
    导 航：<span class="current">首 页</span>
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
    
   	<div class="center_title_bar">新 品 发 布</div>
    
    	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">长袖连衣裙</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p1.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 150</span></div>                        
            </div>
           
            <div class="prod_details_tab">
            <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>            
            </div>                     
        </div>
    
    	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">蝙蝠袖衬衫</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p2.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 90</span></div>                        
            </div>
           
            <div class="prod_details_tab">
            <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>              
            </div>                     
        </div>    
 

     	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">阔腿裤</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p3.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 120</span></div>                        
            </div>
           
            <div class="prod_details_tab">
            <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>              
            </div>                     
        </div>
 
     	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">薄外套</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p4.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 85</span></div>                        
            </div>
           
            <div class="prod_details_tab">
            <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>           
            </div>                     
        </div>
    
    	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">纯色针织</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p5.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 70</span></div>                        
            </div>
           
            <div class="prod_details_tab">
            <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>            
            </div>                     
        </div>    
 

     	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">特色女装</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p6.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 140</span></div>                        
            </div>
           
            <div class="prod_details_tab">
            <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>          
            </div>                     
        </div>
 
    	<div class="center_title_bar">为 您 推 荐</div>
    
    	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">男士春秋外套</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p7.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 125</span></div>                        
            </div>
           
            <div class="prod_details_tab">
           <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>           
            </div>                     
        </div>
    
    	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">男士加肥风衣</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p8.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 199</span></div>                        
            </div>
           
            <div class="prod_details_tab">
            <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>         
            </div>                     
        </div>    
 

     	<div class="prod_box">

            <div class="center_prod_box">            
                 <div class="product_title"><a href="details.jsp">翻领中长款夹克</a></div>
                 <div class="product_img"><a href="details.jsp"><img src="images/p9.jpg" alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price">￥ 99</span></div>                        
            </div>
           
            <div class="prod_details_tab">
            <a href="login.jsp" class="prod_buy">加入购物车</a>          
            <a href="details.jsp" class="prod_details">详情</a>           
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
            ~ 空空如也 ~<br/>
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
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
		<!-- 界面重用——右侧搜索&义卖统计   -->
		<div class="title_box">物 品 搜 索</div><br/>		
		<form method="post" action="searchResult1.jsp">				  
			<input type="text" name="search"/>
			<br/><br/>
			<input type="submit" value="搜索"/>			
        </form>
        
        <div class="title_box">公 告</div>
        <span class="product_title">本站累计义卖金额:</span>
        <span class="donation"><%=donation %></span>
        <span class="product_title">↓欢迎扫码直接捐款↓</span>
        <img src="images/QRcode.png" class="product_img"/>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
		<!-- 界面重用——顶端导航栏[登录后] -->
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
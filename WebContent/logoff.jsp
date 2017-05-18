<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
</head>
<body>

<%
	session.invalidate();
	out.println("<script language='javascript'>alert('您已退出登录！即将返回首页…');window.location.href='index.jsp';</script>");
%>

</body>
</html>
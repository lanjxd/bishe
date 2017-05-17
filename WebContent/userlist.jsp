<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*, java.util.ArrayList" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>中 财 二 手 义 卖</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">  
    function confirmDelete(name){  
    	if(confirm("确认删除?")){  
        	window.location="deleteUser.jsp?username="+name;
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
	ArrayList<User> userlist = new ArrayList<User>();
	userlist = conn.getAllUser();
    User au = new User();
    
    String donation = conn.getDonation();
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
    	导 航：<span class="current">用 户 管 理</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
     
   </div><!-- end of left content --> 

   <div class="center_content">
    
   	<div class="center_title_bar">注 册 用 户 列 表</div>
    
    <%
    
    	for(int j = userlist.size(); j > 0 ; j--){
    		
    		au = userlist.get(j-1);
    		
    		String usertype = au.getUserauth();
    		if(usertype.equals("1")){
    			usertype = "买家";
    		}else if(usertype.equals("2")){
    			usertype = "卖家";
    		}else{
    			usertype = "系统管理员";
    		}
    		
    		out.println("<div class='prod_box'>");
            out.println("<div class='center_prod_box'>");
            out.println("<div class='product_title_big'>");
            out.println(au.getUsername());
            out.println("</div>");
            out.println("<div class='specifications'>");
            out.println("<span class='blue'>类型:");
            out.println(usertype);
            out.println("</span></div>");            
            out.println("<a href=\"javascript:confirmDelete('");
            out.println(au.getUsername());
            out.println("')\" class='prod_favor'>删除此用户</a>");
            out.println("<a href='userinfo.jsp?username=");
            out.println(au.getUsername());
            out.println("' class='prod_details'>更新用户信息</a>");
            out.println("</div></div>");
            
    	}
    
 	%>
      
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
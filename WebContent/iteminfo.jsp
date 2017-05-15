<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, DAO.*" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<html>
<head>
<title>中 财 二 手 义 卖</title>
<link rel="stylesheet" type="text/css" href="style.css" />
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
    	导 航：<span class="current">修 改 物 品 信 息</span>
    </div>        
    
   <div class="left_content">
   
    	<%@ include file="left_content1.jsp" %>
     
   </div><!-- end of left content --> 

   <div class="center_content">
   
   	<div class="center_title_bar">更 新 物 品 信 息</div>
    
    	<div class="prod_box_big">
      
            <div class="center_prod_box_big">            
                 
                <form method="post" action="dealItemUpdate.jsp?id=<%=id %>" name="itemUpdateForm" class="contact_form">       
                    <div class="form_row">
                    <label><strong>名 称:</strong></label>
                    <input type="text" class="contact_input" name="i_name" value="<%=i.getitemname() %>" required="required"/>
                    </div>  

                    <div class="form_row">
                    <label><strong>分 类 :</strong></label>
                    <select class="contact_input" name="i_cate" required="required">
                    <option value="1">图书教辅</option>
					<option value="2">数码产品</option>
					<option value="3">办公文具</option>
					<option value="4">体育器材</option>
					<option value="5">生活用品</option>
					<option value="6">手工艺品</option>
					<option value="7">男 装</option>
					<option value="8">女 装</option>
					<option value="9">其 它</option>					
                    </select>
                    </div>

                    <div class="form_row">
                    <label><strong>状 态:</strong></label>
                    <input type="text" class="contact_input" name="i_cond" value="<%=i.getitemcond() %>" required="required"/>
                    </div>
					
					<div class="form_row">
                    <label><strong>单 价:</strong></label>
                    <input type="text" class="contact_input" name="i_price" value="<%=i.getitemprice() %>" required="required"/>
                    </div>

					<div class="form_row">
                    <label><strong>数 量:</strong></label>
                    <input type="text" class="contact_input" name="i_count" value="<%=i.getitemcount() %>" required="required"/>
                    </div>
					
					<div class="form_row">
                    <label><strong>图片链接:</strong></label>
                    <input type="text" class="contact_input" name="i_image" value="<%=i.getitemimage() %>"/>
                    </div>
					
                    <div class="form_row">
                    <label><strong>描 述:</strong></label>
                    <textarea class="contact_textarea" name="i_info"><%=i.getiteminfo() %></textarea>
                    </div>

                    <div class="form_row">
                    <input type="submit" value="发布" class="prod_details"/>
                    </div>      
                </form>
                                    
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
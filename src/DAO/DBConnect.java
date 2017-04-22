package DAO;

import java.sql.*;

public class DBConnect {

	public Connection Connect2MySQL() throws Exception{
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://127.0.0.1:3306/bishe?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		Class.forName(driver);
		Connection conn=DriverManager.getConnection(url, "root", "root");
		return conn;
	}
	
	public boolean chkUser(String username, String userpwd) throws Exception{		
		String chkStr = "Select * from user where username = '" + username + "' and userpwd = '" + userpwd + "'";
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(chkStr);
		User u = new User();
		u.setUsername("null");
		u.setUserpwd("null");
		if(rs.next()){
			u.setUsername(rs.getString("username"));
			u.setUserpwd(rs.getString("userpwd"));
		}
		if(u.getUsername().equals(username) && u.getUserpwd().equals(userpwd)){
			System.out.println("user confirmed");
			rs.close();
			stmt.close();
			conn.close();
			return true;
		}
		return false;			
	}
	
	public boolean isUserExist(String username) throws Exception{		
		String Str = "Select * from user where username = '" + username + "'";
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);		
		if(rs.next()){
			return true;
		}
		return false;			
	}

	public User saveUser(String username) throws Exception {		
		String str = "Select * from user where username = '" + username + "'";		
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(str);			
		User u = new User();		
		if(rs.next()){		
		u.setUsername(rs.getString("username"));
		u.setUsermail(rs.getString("usermail"));
		u.setUserpwd(rs.getString("userpwd"));
		u.setUserphone(rs.getString("userphone"));
		u.setUseradd(rs.getString("useradd"));
		u.setUsernick(rs.getString("usernick"));
		u.setUserauth(rs.getString("userauth"));	
		}
		rs.close();
		stmt.close();
		conn.close();
		return u;	
	}
	
	public void createUser(String username, String userpwd, String usernick, String usermail, String userphone, String useradd) throws Exception {
		String str = "INSERT INTO `bishe`.`user` (`username`, `userpwd`, `usernick`, `usermail`, `userphone`, `useradd`, `userauth`) VALUES (?,?,?,?,?,?,1);";		
		Connection conn = this.Connect2MySQL();
		PreparedStatement ps = conn.prepareStatement(str);
		ps.setString(1, username);
		ps.setString(2, userpwd);
		ps.setString(3, usernick);
		ps.setString(4, usermail);
		ps.setString(5, userphone);
		ps.setString(6, useradd);
		if(ps.executeUpdate()==1){
			System.out.println("new user <" + username + "> created");
		}
		ps.close();
		conn.close();
	}
	
	public void alterUserInfo(String username, String userpwd, String usernick, String usermail, String userphone, String useradd) throws Exception{		
		String alterStr = "UPDATE user SET userpwd='" + userpwd + "', usernick='" + usernick + "', usermail='" +  usermail + "', userphone='" + userphone + "', useradd='" + useradd + "' WHERE username='" + username + "'";
		System.out.println(alterStr);		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(alterStr);
		stmt.close();
		conn.close();
	}
	
	public void uploadItem(String itemname, String itemcate, String itemcond, String itemprice, String itemcount, String iteminfo, String username) throws Exception {
		String str = "INSERT INTO `bishe`.`item` (`itemname`, `itemcate`, `itemcond`, `itemprice`, `itemcount`, `iteminfo`, `itemseller`) VALUES (?,?,?,?,?,?,?);";		
		Connection conn = this.Connect2MySQL();
		PreparedStatement ps = conn.prepareStatement(str);
		ps.setString(1, itemname);
		ps.setString(2, itemcate);
		ps.setString(3, itemcond);
		ps.setString(4, itemprice);
		ps.setString(5, itemcount);
		ps.setString(6, iteminfo);
		ps.setString(7, username);
		if(ps.executeUpdate()==1){
			System.out.println("new item <" + itemname + "> uploaded");
		}
		ps.close();
		conn.close();
	}
	
}
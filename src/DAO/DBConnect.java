package DAO;

import java.sql.*;
import java.util.ArrayList;

public class DBConnect {

	public Connection Connect2MySQL() throws Exception{
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://127.0.0.1:3306/bishe?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		Class.forName(driver);
		Connection conn=DriverManager.getConnection(url, "root", "root");
		return conn;
	}
	
	public boolean chkUser(String username, String userpwd) throws Exception{		
		String chkStr = "Select * from `user` where username = '" + username + "' and userpwd = '" + userpwd + "'";
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
		String Str = "Select * from `user` where username = '" + username + "'";
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);		
		if(rs.next()){
			return true;
		}
		return false;			
	}

	public User saveUser(String username) throws Exception {		
		String str = "Select * from `user` where username = '" + username + "'";		
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
		u.setUserauth(rs.getString("userauth"));	
		}
		rs.close();
		stmt.close();
		conn.close();
		return u;	
	}
	
	public void createUser(String username, String userpwd, String usermail, String userphone, String useradd, String userauth) throws Exception {
		String str = "INSERT INTO `bishe`.`user` (`username`, `userpwd`, `usermail`, `userphone`, `useradd`, `userauth`) VALUES (?,?,?,?,?,?);";		
		Connection conn = this.Connect2MySQL();
		PreparedStatement ps = conn.prepareStatement(str);
		ps.setString(1, username);
		ps.setString(2, userpwd);
		ps.setString(3, usermail);
		ps.setString(4, userphone);
		ps.setString(5, useradd);
		ps.setString(6, userauth);
		if(ps.executeUpdate()==1){
			System.out.println("new user <" + username + "> created");
		}
		ps.close();
		conn.close();
	}
	
	public void alterUserInfo(String username, String userpwd, String usermail, String userphone, String useradd) throws Exception{		
		String alterStr = "UPDATE `user` SET userpwd='" + userpwd + "', usermail='" +  usermail + "', userphone='" + userphone + "', useradd='" + useradd + "' WHERE username='" + username + "'";		
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
	
	public void alterItemInfo(String itemname, String itemcate, String itemcond, String itemprice, String itemcount, String iteminfo, String itemid) throws Exception{		
		String alterStr = "UPDATE `item` SET itemname='" + itemname + "', itemcate='" + itemcate + "', itemcond='" + itemcond + "', itemprice=" +  itemprice + ", itemcount=" + itemcount + ", iteminfo='" + iteminfo + "' WHERE itemid=" + itemid;		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(alterStr);
		stmt.close();
		conn.close();
	}
	
	public Item getItem(String itemid) throws Exception {		
		String str = "Select * from `item` where itemid = " + itemid ;
		Connection conn = this.Connect2MySQL();	
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(str);
		Item i = new Item();
		if(rs.next()){
		i.setitemname(rs.getString("itemname"));
		i.setitemcate(rs.getString("itemcate"));
		i.setitemcond(rs.getString("itemcond"));
		i.setitemprice(rs.getString("itemprice"));
		i.setitemcount(rs.getString("itemcount"));
		i.setiteminfo(rs.getString("iteminfo"));
		i.setitemseller(rs.getString("itemseller"));
		}
		rs.close();
		stmt.close();
		conn.close();
		return i;
	}
	
	public ArrayList<Item> getAllItem() throws Exception {
		ArrayList<Item> itemlist = new ArrayList<Item>();
		String Str = "SELECT * FROM `item`";	
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);	
		while(rs.next()){
			Item i = new Item();
			i.setitemid(rs.getString("itemid"));
			i.setitemname(rs.getString("itemname"));
			i.setitemcate(rs.getString("itemcate"));
			i.setitemcond(rs.getString("itemcond"));
			i.setitemprice(rs.getString("itemprice"));
			i.setitemcount(rs.getString("itemcount"));
			i.setiteminfo(rs.getString("iteminfo"));
			i.setitemseller(rs.getString("itemseller"));
			itemlist.add(i);
		}
		rs.close();
		stmt.close();
		conn.close();
		return itemlist;
	}
	
	public ArrayList<Item> getMyitem(String username) throws Exception {
		ArrayList<Item> myitemlist = new ArrayList<Item>();
		String Str = "SELECT * FROM `item` WHERE itemseller = '" + username + "'";	
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);	
		while(rs.next()){
			Item i = new Item();
			i.setitemid(rs.getString("itemid"));
			i.setitemname(rs.getString("itemname"));
			i.setitemcate(rs.getString("itemcate"));
			i.setitemcond(rs.getString("itemcond"));
			i.setitemprice(rs.getString("itemprice"));
			i.setitemcount(rs.getString("itemcount"));
			i.setiteminfo(rs.getString("iteminfo"));
			i.setitemseller(rs.getString("itemseller"));
			myitemlist.add(i);
		}
		rs.close();
		stmt.close();
		conn.close();
		return myitemlist;
	}
	
	public void deleteItem(String itemid) throws Exception {
		String deleteStr = "delete from `item` where itemid = " + itemid;		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(deleteStr);
		System.out.println(deleteStr);
		stmt.close();
		conn.close();
	}
	
	public boolean chkFavor(String favoruser, String favoritem) throws Exception{		
		String Str = "Select * from `favor` where favoruser = '" + favoruser + "' and favoritem = " + favoritem;
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);		
		if(rs.next()){
			return true;
		}
		return false;			
	}
	
	public void favor(String favoruser, String favoritem) throws Exception {
		java.util.Date now = new java.util.Date();
		java.sql.Timestamp ts = new java.sql.Timestamp(now.getTime());
		String str = "INSERT INTO `bishe`.`favor` (`favoruser`, `favoritem`, `favortime`) VALUES (?,?,?);";		
		Connection conn = this.Connect2MySQL();
		PreparedStatement ps = conn.prepareStatement(str);
		ps.setString(1, favoruser);
		ps.setString(2, favoritem);
		ps.setTimestamp(3, ts);
		if(ps.executeUpdate()==1){
			System.out.println("itemid " + favoritem + " favored by user <" + favoruser + ">");
		}
		ps.close();
		conn.close();
	}
	
	public void unfavor(String favoruser, String favoritem) throws Exception {
		String cancelStr = "delete from `favor` where favoruser = '" + favoruser + "' and favoritem = " + favoritem;		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(cancelStr);
		System.out.println(cancelStr);
		stmt.close();
		conn.close();
	}
	
	public ArrayList<Favor> getMyfavor(String favoruser) throws Exception {
		ArrayList<Favor> myfavor = new ArrayList<Favor>();
		String Str = "SELECT * FROM `favor` where favoruser = '" + favoruser + "'";	
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);	
		while(rs.next()){
			Favor f = new Favor();
			f.setfavoritem(rs.getString("favoritem"));
			f.setfavortime(rs.getString("favortime"));
			myfavor.add(f);
		}
		rs.close();
		stmt.close();
		conn.close();
		return myfavor;
	}
	
	public void newOrder(String orderitem, String buyername, String sellername, String ordercount, String ordersum, String ordercond) throws Exception {
		java.util.Date now = new java.util.Date();
		java.sql.Timestamp ts = new java.sql.Timestamp(now.getTime());
		String str = "INSERT INTO `bishe`.`order` (`orderitem`, `buyername`, `sellername`, `ordercount`, `ordersum`, `ordercond`, `ordertime`) VALUES (?,?,?,?,?,?,?);";		
		Connection conn = this.Connect2MySQL();
		PreparedStatement ps = conn.prepareStatement(str);
		ps.setString(1, orderitem);
		ps.setString(2, buyername);
		ps.setString(3, sellername);
		ps.setString(4, ordercount);
		ps.setString(5, ordersum);
		ps.setString(6, ordercond);
		ps.setTimestamp(7, ts);
		if(ps.executeUpdate()==1){
			System.out.println("new order created");
		}
		ps.close();
		conn.close();
	}
	
	public void cancelOrder(String orderid) throws Exception {
		String cancelStr = "delete from `order` where orderid = " + orderid;		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(cancelStr);
		System.out.println(cancelStr);
		stmt.close();
		conn.close();
	}
	
	public ArrayList<Order> getOrderBuy(String username) throws Exception {
		ArrayList<Order> orderbuy = new ArrayList<Order>();
		String Str = "SELECT * FROM `order` where buyername = '" + username + "'";
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);	
		while(rs.next()){
			Order d = new Order();
			d.setorderid(rs.getString("orderid"));
			d.setorderitem(rs.getString("orderitem"));
			d.setsellername(rs.getString("sellername"));
			d.setordercount(rs.getString("ordercount"));
			d.setordersum(rs.getString("ordersum"));
			d.setordercond(rs.getString("ordercond"));
			d.setordertime(rs.getString("ordertime"));
			orderbuy.add(d);
		}
		rs.close();
		stmt.close();
		conn.close();
		return orderbuy;
	}
	
	public ArrayList<Order> getOrderSell(String username) throws Exception {
		ArrayList<Order> ordersell = new ArrayList<Order>();
		String Str = "SELECT * FROM `order` where sellername = '" + username + "'";
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);	
		while(rs.next()){
			Order d = new Order();
			d.setorderid(rs.getString("orderid"));
			d.setorderitem(rs.getString("orderitem"));
			d.setbuyername(rs.getString("buyername"));
			d.setordercount(rs.getString("ordercount"));
			d.setordersum(rs.getString("ordersum"));
			d.setordercond(rs.getString("ordercond"));
			d.setordertime(rs.getString("ordertime"));
			ordersell.add(d);
		}
		rs.close();
		stmt.close();
		conn.close();
		return ordersell;
	}
	
	public void payOrder(String orderid) throws Exception {
		String alterStr = "update `order` set ordercond = 'Î´·¢»õ' where orderid = " + orderid;		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(alterStr);
		System.out.println(alterStr);
		stmt.close();
		conn.close();
	}
	
	public ArrayList<Item> getSearch(String search) throws Exception {
		ArrayList<Item> searchlist = new ArrayList<Item>();
		String searchStr = "SELECT * FROM `item` WHERE itemname LIKE '%" + search + "%'";	
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(searchStr);	
		while(rs.next()){
			Item i = new Item();
			i.setitemid(rs.getString("itemid"));
			i.setitemname(rs.getString("itemname"));
			i.setitemcate(rs.getString("itemcate"));
			i.setitemcond(rs.getString("itemcond"));
			i.setitemprice(rs.getString("itemprice"));
			i.setitemcount(rs.getString("itemcount"));
			i.setiteminfo(rs.getString("iteminfo"));
			i.setitemseller(rs.getString("itemseller"));
			searchlist.add(i);
		}
		rs.close();
		stmt.close();
		conn.close();
		return searchlist;
	}
	
}
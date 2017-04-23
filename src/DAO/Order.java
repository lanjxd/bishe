package DAO;

public class Order {
	
	private String orderid;
	private String orderitem;
	private String ordercount;
	private String buyername;
	private String sellername;
	private String ordersum;
	private String ordertime;
	private String orderinfo;
	private String ordercond;

	public String getorderid() {
		return orderid;
	}
	public void setorderid(String orderid) {
		this.orderid = orderid;
	}
	public String getsellername() {
		return sellername;
	}
	public void setsellername(String sellername) {
		this.sellername = sellername;
	}
	public String getorderitem() {
		return orderitem;
	}
	public void setorderitem(String orderitem) {
		this.orderitem = orderitem;
	}
	public String getordercount() {
		return ordercount;
	}
	public void setordercount(String ordercount) {
		this.ordercount = ordercount;
	}
	public String getbuyername() {
		return buyername;
	}
	public void setbuyername(String buyername) {
		this.buyername = buyername;
	}
	public String getordersum() {
		return ordersum;
	}
	public void setordersum(String ordersum) {
		this.ordersum = ordersum;
	}
	public String getordertime() {
		return ordertime;
	}
	public void setordertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getorderinfo() {
		return orderinfo;
	}
	public void setorderinfo(String orderinfo) {
		this.orderinfo = orderinfo;
	}
	public String getordercond() {
		return ordercond;
	}
	public void setordercond(String ordercond) {
		this.ordercond = ordercond;
	}
}


package DAO;

public class Cart {
	
	private String cartuser;
	private String cartitem;
	private String cartcount;
	private String cartsum;

	public String getcartuser() {
		return cartuser;
	}
	public void setcartuser(String cartuser) {
		this.cartuser = cartuser;
	}
	public String getcartsum() {
		return cartsum;
	}
	public void setcartsum(String cartsum) {
		this.cartsum = cartsum;
	}
	public String getcartitem() {
		return cartitem;
	}
	public void setcartitem(String cartitem) {
		this.cartitem = cartitem;
	}
	public String getcartcount() {
		return cartcount;
	}
	public void setcartcount(String cartcount) {
		this.cartcount = cartcount;
	}
}


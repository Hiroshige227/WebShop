
	
	package model;

	import java.io.Serializable;
public class BookBean implements Serializable{
	private String bid;
	private String title;
	private String cop;
	private String auth;
	private String price;
	private String num;
	
	
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {	
		this.title = title;
	}
	public String getCop() {
		return cop;
	}
	public void setCop(String cop) {
		this.cop = cop;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNum() {
		return num;
		}
	public void setNum(String num) {
		this.num = num;
	}
}
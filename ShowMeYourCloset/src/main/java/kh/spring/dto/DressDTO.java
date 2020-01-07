package kh.spring.dto;

import java.sql.Date;

public class DressDTO {
	private int no;
	private int c_no;
	private String email;
	private String name;
	private String category;
	private String pub;
	private String season;
	private Date write_date;
	private String memo;
	private String price;
	private String buy_date;
	
	public DressDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DressDTO(int no, int c_no, String email, String name, String category, String pub, String season,
			Date write_date, String memo, String price, String buy_date) {
		super();
		this.no = no;
		this.c_no = c_no;
		this.email = email;
		this.name = name;
		this.category = category;
		this.pub = pub;
		this.season = season;
		this.write_date = write_date;
		this.memo = memo;
		this.price = price;
		this.buy_date = buy_date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPub() {
		return pub;
	}

	public void setPub(String pub) {
		this.pub = pub;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	@Override
	public String toString() {
		return "DressDTO [no=" + no + ", c_no=" + c_no + ", email=" + email + ", name=" + name + ", category="
				+ category + ", pub=" + pub + ", season=" + season + ", write_date=" + write_date + ", memo=" + memo
				+ ", price=" + price + ", buy_date=" + buy_date + "]";
	}
	
	
}

package kh.spring.dto;

import java.sql.Date;

public class StyleDTO {
	private int no;
	private String name;
	private String email;
	private String top;
	private String pants;
	private String shoes;
	private String acc;
	private String season;
	private String memo;
	private Date write_date;
	
	public StyleDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StyleDTO(int no, String name, String email, String top, String pants, String shose, String acc,
			String season, String memo, Date write_date) {
		super();
		this.no = no;
		this.name = name;
		this.email = email;
		this.top = top;
		this.pants = pants;
		this.shoes = shose;
		this.acc = acc;
		this.season = season;
		this.memo = memo;
		this.write_date = write_date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public String getPants() {
		return pants;
	}
	public void setPants(String pants) {
		this.pants = pants;
	}
	public String getShoes() {
		return shoes;
	}
	public void setShoes(String shose) {
		this.shoes = shose;
	}
	public String getAcc() {
		return acc;
	}
	public void setAcc(String acc) {
		this.acc = acc;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	@Override
	public String toString() {
		return "StyleDTO [no=" + no + ", name=" + name + ", email=" + email + ", top=" + top + ", pants=" + pants
				+ ", shose=" + shoes + ", acc=" + acc + ", season=" + season + ", memo=" + memo + ", write_date="
				+ write_date + "]";
	}
}

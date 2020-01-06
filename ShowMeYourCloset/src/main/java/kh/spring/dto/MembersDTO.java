package kh.spring.dto;

import java.sql.Date;

public class MembersDTO {
	private String email;
	private String pw;
	private String name;
	private String nickname;
	private String phone;
	private String gender;
	private Date join_date;
	private String ban;
	private String authkey;
	private int authstatus;

	public MembersDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MembersDTO(String email, String pw, String name, String nickname, String phone, String gender, Date join_date, String ban,
			String authkey, int authstatus) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.gender = gender;
		this.join_date = join_date;
		this.ban = ban;
		this.authkey = authkey;
		this.authstatus = authstatus;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getBan() {
		return ban;
	}
	public void setBan(String ban) {
		this.ban = ban;
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	public int getAuthstatus() {
		return authstatus;
	}
	public void setAuthstatus(int authstatus) {
		this.authstatus = authstatus;
	}
	

}

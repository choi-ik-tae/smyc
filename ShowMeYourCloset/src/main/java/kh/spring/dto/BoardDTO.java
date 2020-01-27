package kh.spring.dto;

import kh.spring.Utils.DateFormat;

public class BoardDTO {
	private int no;
	private String category;
	private int s_no;
	private String email;
	private String nickname;
	private String title;
	private String contents;
	private String write_date;
	private String views;
	
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(int no, String category, int s_no, String email, String nickname, String title, String contents,
			String write_date, String views) {
		super();
		this.no = no;
		this.category = category;
		this.s_no = s_no;
		this.email = email;
		this.nickname = nickname;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.views = views;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWrite_date() {
		String wd = write_date;
		try {
			return DateFormat.dateformat(wd);
		} catch (Exception e) {
			return write_date;
		}
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getViews() {
		return views;
	}
	public void setViews(String views) {
		this.views = views;
	}
	
	
	

}

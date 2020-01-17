package kh.spring.dto;

public class CommentDTO {
	private int no;
	private int b_no;
	private String email;
	private String nickname;
	private String contents;
	private String write_date;
	
	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentDTO(int no, int b_no, String email, String nickname, String contents, String write_date) {
		super();
		this.no = no;
		this.b_no = b_no;
		this.email = email;
		this.nickname = nickname;
		this.contents = contents;
		this.write_date = write_date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
	


}

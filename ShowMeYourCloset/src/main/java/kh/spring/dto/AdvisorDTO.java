package kh.spring.dto;

public class AdvisorDTO {
	private int no;
	private int b_no;
	private String email;
	private String nickname;
	private String title;
	private String contents;
	private String top;
	private String pants;
	private String shoes;
	private String acc;
	private String choice;
	private String write_date;
	
	
	public AdvisorDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdvisorDTO(int no, int b_no, String email, String nickname, String title, String contents, String top,
			String pants, String shoes, String acc, String choice, String write_date) {
		super();
		this.no = no;
		this.b_no = b_no;
		this.email = email;
		this.nickname = nickname;
		this.title = title;
		this.contents = contents;
		this.top = top;
		this.pants = pants;
		this.shoes = shoes;
		this.acc = acc;
		this.choice = choice;
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
	public void setShoes(String shoes) {
		this.shoes = shoes;
	}
	public String getAcc() {
		return acc;
	}
	public void setAcc(String acc) {
		this.acc = acc;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
	

}

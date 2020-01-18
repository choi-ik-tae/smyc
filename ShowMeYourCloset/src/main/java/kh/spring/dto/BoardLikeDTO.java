package kh.spring.dto;

public class BoardLikeDTO {
	private int no;
	private int b_no;
	private String email;
	private String category;
	
	public BoardLikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardLikeDTO(int no, int b_no, String email, String category) {
		super();
		this.no = no;
		this.b_no = b_no;
		this.email = email;
		this.category = category;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}

package kh.spring.dto;

public class NotifyDTO {
	private int no;
	private String category;
	private int c_no;
	private String email;
	private String write_date;
	
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
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public NotifyDTO(int no, String category, int c_no, String email, String write_date) {
		super();
		this.no = no;
		this.category = category;
		this.c_no = c_no;
		this.email = email;
		this.write_date = write_date;
	}
	public NotifyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

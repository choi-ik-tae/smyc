package kh.spring.dto;

public class ClosetDTO {
	private int no;
	private String email;
	private String name;
	private String memo;
	private String pub;
	private String img;
	
	public ClosetDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClosetDTO(int no, String email, String name, String memo, String pub, String img) {
		super();
		this.no = no;
		this.email = email;
		this.name = name;
		this.memo = memo;
		this.pub = pub;
		this.img = img;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
	
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getPub() {
		return pub;
	}

	public void setPub(String pub) {
		this.pub = pub;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}

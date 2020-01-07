package kh.spring.dto;

import org.springframework.web.multipart.MultipartFile;

public class DressImgsDTO {
	private int no;
	private int d_no;
	private String ori_name;
	private String sys_name;
	private String path;
	
	public DressImgsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DressImgsDTO(int no, int d_no, String ori_name, String sys_name, String path) {
		super();
		this.no = no;
		this.d_no = d_no;
		this.ori_name = ori_name;
		this.sys_name = sys_name;
		this.path = path;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getSys_name() {
		return sys_name;
	}

	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}

package kh.spring.dto;

import kh.spring.Utils.DateFormat;

public class VisitorDTO {
	private int no;
	private String ipAddr;
	private String visite_date;
	
	public VisitorDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VisitorDTO(int no, String ipAddr, String visite_date) {
		super();
		this.no = no;
		this.ipAddr = ipAddr;
		this.visite_date = visite_date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getVisite_date() {
		String wd = visite_date;
		try {
			return DateFormat.dateformat(wd);
		} catch (Exception e) {
			return visite_date;
		}
	}
	public void setVisie_date(String visite_date) {
		this.visite_date = visite_date;
	}
}

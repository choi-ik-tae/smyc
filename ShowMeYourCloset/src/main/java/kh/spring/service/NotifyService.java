package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.NotifyDAO;
import kh.spring.dto.NotifyDTO;

@Service
public class NotifyService {

	@Autowired
	private NotifyDAO notifyDAO;
	
	public String checkNotify(String category, int c_no, String email) {
		return notifyDAO.checkNotify(category, c_no, email);		
	}
	
	public void insertNotify(NotifyDTO dto) {
		notifyDAO.insertNotify(dto);
	}
	
	public int notifyCount(String category, int c_no) {
		return notifyDAO.notifyCount(category, c_no);
	}
}

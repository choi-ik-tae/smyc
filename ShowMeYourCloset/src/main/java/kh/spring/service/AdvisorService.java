package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.AdvisorDAO;
import kh.spring.dto.AdvisorDTO;

@Service
public class AdvisorService {
	
	@Autowired
	private AdvisorDAO advisorDAO;
	
	public List<AdvisorDTO> selectAdvisorAll(int b_no){
		return advisorDAO.selectAdvisorAll(b_no);
	}
	
	public List<AdvisorDTO> selectByPage(int start, int end, int b_no){
		return advisorDAO.selectByPage(start, end, b_no);
	}
	
	public void insertAdivisor(AdvisorDTO dto) {
		advisorDAO.insertAdivisor(dto);
	}
	
	public AdvisorDTO selectAdvisorDTO(int no) {
		return advisorDAO.selectAdvisorDTO(no);
	}

}

package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.AdminDAO;
import kh.spring.dto.BoardDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO addao;
	
	public int selectMembers() {
		return addao.selectMembers();
	}
	
	public int selectMemByM() {
		return addao.selectMemByM();
	}
	
	public int selectMemByW() {
		return addao.selectMemByW();
	}
	
	public List<BoardDTO> selectByBoastByView() {
		return addao.selectByBoastByView();
	}
	
	public List<BoardDTO> selectByHelpByView() {
		return addao.selectByHelpByView();
	}
	
}

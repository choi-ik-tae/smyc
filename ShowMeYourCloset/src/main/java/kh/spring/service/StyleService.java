package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ClosetDAO;
import kh.spring.dao.StyleDAO;
import kh.spring.dto.ClosetDTO;
import kh.spring.dto.StyleDTO;

@Service
public class StyleService {

	@Autowired
	private StyleDAO sdao;

	@Autowired
	private ClosetDAO cdao;

	public List<String> selectCategoryAll(String email, String category, int c_no) {

		List<String> pathList = sdao.selectCategoryAll(email, category, c_no);

		return pathList;
	}

	public void insert(StyleDTO dto) {

		sdao.insert(dto);
	}

	public List<StyleDTO> selectAll(String email) {
		return sdao.selectAll(email);
	}

	public List<StyleDTO> selectSeason(String email, String season) {
		return sdao.selectSeason(season, email);
	}

	public List<StyleDTO> searchStyle(String name, String email) {
		return sdao.searchStyle(name, email);
	}

	public List<ClosetDTO> selectClosetAll(String email) {
		return cdao.selectByEmail(email);
	}

	// 코디 상세보기
	public StyleDTO detailStyle(int no) {
		return sdao.detailStyle(no);
	}

	public void styleModify(StyleDTO dto) {
		sdao.styleModify(dto);
	}

	// 코디 삭제
	public void styleDelete(int no) {
		sdao.styleDelete(no);
	}

	public List<String> selectPubCategoryAll(String email, String category, int c_no) {
		List<String> pathList = sdao.selectPubCategoryAll(email, category, c_no);

		return pathList;
	}
	
	
}

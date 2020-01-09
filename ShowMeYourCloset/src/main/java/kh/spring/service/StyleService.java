package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.StyleDAO;
import kh.spring.dto.StyleDTO;

@Service
public class StyleService {

	@Autowired
	private StyleDAO sdao;
	
	public List<String> selectCategoryAll(String email, String category){
		
		List<String> pathList = sdao.selectCategoryAll(email, category);
		
		return pathList;
	}
	
	
	public void insert(StyleDTO dto) {
		
		sdao.insert(dto);
	}
}

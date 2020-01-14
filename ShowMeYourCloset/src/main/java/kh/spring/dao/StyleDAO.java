package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.StyleDTO;

@Repository
public class StyleDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<String> selectCategoryAll(String email, String category,int c_no){
		Map<String, Object> parm = new HashMap<>();
		parm.put("email",email);
		parm.put("category",category);
		parm.put("c_no",c_no);
		return sst.selectList("Style.selectCategoryAll", parm); 
	}
	
	public int insert(StyleDTO dto) {
		Map<String, String> parm = new HashMap<>();
		parm.put("name",dto.getName());
		parm.put("email",dto.getEmail());
		parm.put("top",dto.getTop());
		parm.put("pants",dto.getPants());
		parm.put("shoes",dto.getShoes());
		parm.put("acc",dto.getAcc());
		parm.put("season",dto.getSeason());
		parm.put("memo",dto.getMemo());
		
		return sst.insert("Style.insert",parm);
		
	}
	
	public List<StyleDTO> selectAll(String email){
		return sst.selectList("Style.selectAll",email);
	}
	
	public List<StyleDTO> selectSeason(String season, String email){
		Map<String, String> parm = new HashMap<>();
		parm.put("email",email);
		parm.put("season","%"+season+"%");
		
		return sst.selectList("Style.selectSeason",parm);
	}
	
	public List<StyleDTO> searchStyle(String name, String email){
		Map<String, String> parm = new HashMap<>();
		parm.put("email",email);
		parm.put("name","%"+name+"%");
		return sst.selectList("Style.searchStyle", parm);
	}
	
	// 코디 상세보기
	public StyleDTO detailStyle(int no) {
		return sst.selectOne("Style.detailStyle",no);
	}
	
	// 코디 수정
	public int styleModify(StyleDTO dto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("no",dto.getNo());
		parm.put("name",dto.getName());
		parm.put("email",dto.getEmail());
		parm.put("top",dto.getTop());
		parm.put("pants",dto.getPants());
		parm.put("shoes",dto.getShoes());
		parm.put("acc",dto.getAcc());
		parm.put("season",dto.getSeason());
		parm.put("memo",dto.getMemo());
		
		return sst.insert("Style.styleModify",parm);
	}
	
	//	코디 삭제
	public int styleDelete(int no) {
		return sst.delete("Style.styleDelete",no);
	}
	
	// 옷 삭제시 코디 아이템 삭제
	public int deleteItem(String category,String path) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("category",category);
		parm.put("path",path);
		
		return sst.update("Style.deleteItem",parm);
	}
	// 옷 수정시 코디 아이템 수정
	public int updateItem(String category,String path,String val) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("category",category);
		parm.put("path",path);
		parm.put("val",val);
		
		return sst.update("Style.updateItem",parm);
	}

}

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
	
	public List<String> selectCategoryAll(String email, String category){
		Map<String, String> parm = new HashMap<>();
		parm.put("email",email);
		parm.put("category",category);
		return sst.selectList("Style.selectCategoryAll", parm); 
	}
	
	public int insert(StyleDTO dto) {
		Map<String, String> parm = new HashMap<>();
		parm.put("name",dto.getName());
		parm.put("email",dto.getEmail());
		parm.put("top",dto.getTop());
		parm.put("pants",dto.getPants());
		parm.put("shose",dto.getShose());
		parm.put("acc",dto.getAcc());
		parm.put("season",dto.getSeason());
		parm.put("memo",dto.getMemo());
		
		return sst.insert("Style.insert",parm);
		
	}
	
	public List<StyleDTO> selectAll(String email){
		return sst.selectList("Style.selectAll",email);
	}

}

package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ClosetDTO;

@Repository
public class ClosetDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 옷장 등록
	public int insert(ClosetDTO dto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("email",dto.getEmail());
		parm.put("name",dto.getName());
		parm.put("memo",dto.getMemo());
		parm.put("pub",dto.getPub());
		parm.put("img",dto.getImg());
		
		return sst.insert("Closet.insert", parm);
	}
	
	// 옷장 번호 가져오기
	public List<ClosetDTO> selectNoByEmail(String email) {
		return sst.selectList("Closet.selectNoByEmail", email);
	}
	
	
}

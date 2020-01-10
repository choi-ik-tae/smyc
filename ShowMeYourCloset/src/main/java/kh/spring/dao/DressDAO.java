package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;

@Repository
public class DressDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	// 옷 등록
	public int insert(DressDTO dto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("c_no",dto.getC_no());
		parm.put("email",dto.getEmail());
		parm.put("name",dto.getName());
		parm.put("category",dto.getCategory());
		parm.put("pub",dto.getPub());
		parm.put("season",dto.getSeason());
		parm.put("memo",dto.getMemo());
		parm.put("price",dto.getPrice());
		parm.put("buy_date",dto.getBuy_date());
		
		return sst.insert("Dress.insert", parm);
	}
	// 옷 정보 가져오기
	public List<DressDTO> selectNo() {
		return sst.selectList("Dress.selectDress");
	}
	// 선택한 옷장 옷 정보 가져오기
	public List<DressDTO> selectByCloset(int num) {
		return sst.selectList("Dress.selectByCloset", num);
	}
	// 사용자가 선택한 옷장 카테고리 별 옷 정보 가져오기
	public List<DressDTO> selectByCategory(String email, String category, int c_no) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("category",category);
		parm.put("c_no",c_no);
		parm.put("email",email);
		
		return sst.selectList("Dress.selectByCategory", parm);
	}
	
}

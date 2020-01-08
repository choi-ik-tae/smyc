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
	// 옷이미지 등록
	public int insertImgs(DressImgDTO fdto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("d_no",fdto.getD_no());
		parm.put("ori_name",fdto.getOri_name());
		parm.put("sys_name",fdto.getSys_name());
		parm.put("path",fdto.getPath());
		
		return sst.insert("Dress.insertImg", parm);
	}
	// 옷 번호 가져오기
	public List<DressDTO> selectNo() {
		return sst.selectList("Dress.selectNo");
	}

	
}

package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgsDTO;

@Repository
public class DressDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public int insert(DressDTO dto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("c_no",dto.getC_no());
		parm.put("email",dto.getEmail());
		parm.put("name",dto.getName());
		parm.put("category",dto.getCategory());
		parm.put("pub",dto.getPub());
		parm.put("season",dto.getSeason());
		parm.put("write_date",dto.getWrite_date());
		parm.put("memo",dto.getMemo());
		parm.put("price",dto.getPrice());
		parm.put("buy_date",dto.getBuy_date());
		
		return sst.insert("Dress.insert", parm);
	}
	

	
}

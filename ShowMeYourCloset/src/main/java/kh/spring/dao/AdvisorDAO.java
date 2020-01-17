package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.AdvisorDTO;

@Repository
public class AdvisorDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<AdvisorDTO> selectAdvisorAll(int b_no){
		return sst.selectList("Advisor.selectAdvisorAll",b_no);	
	}

	public List<AdvisorDTO> selectByPage(int start, int end, int b_no){
		Map<String, Object> parm = new HashMap<>();
		parm.put("start",start);
		parm.put("end",end);
		parm.put("b_no",b_no);
		
		return sst.selectList("Advisor.selectByPage", parm);
	}
}

package kh.spring.dao;

import java.util.List;

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

}

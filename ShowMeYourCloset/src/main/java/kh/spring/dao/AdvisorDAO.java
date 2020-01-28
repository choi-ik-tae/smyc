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
	
	public int insertAdivisor(AdvisorDTO dto) {
		Map<String,Object> parm = new HashMap<>();
		parm.put("b_no",dto.getB_no());
		parm.put("email",dto.getEmail());
		parm.put("nickname",dto.getNickname());
		parm.put("title",dto.getTitle());
		parm.put("contents",dto.getContents());
		parm.put("top",dto.getTop());
		parm.put("pants",dto.getPants());
		parm.put("shoes",dto.getShoes());
		parm.put("acc",dto.getAcc());
		return sst.insert("Advisor.insertAdivisor",parm);
	}
	
	public AdvisorDTO selectAdvisorDTO(int no) {
		return sst.selectOne("Advisor.selectAdvisorDTO", no);
	}
	
	public int updateChoiceAdvisor(String choice , int no) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("choice",choice);
		parm.put("no",no);
		
		return sst.update("Advisor.updateChoiceAdvisor",parm);
	}
	
	public int helpBoardDelete(int no) {
		return sst.delete("Advisor.helpBoardDelete",no);
	}
	
	public int deleteAdvisor(int no) {
		return sst.delete("Advisor.deleteAdvisor", no);
	}
}

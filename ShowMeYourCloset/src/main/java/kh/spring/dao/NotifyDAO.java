package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.NotifyDTO;

@Repository
public class NotifyDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public String checkNotify(String category, int c_no,String email) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("category", category);
		parm.put("c_no",c_no);
		parm.put("email", email);
		return sst.selectOne("Notify.checkNotify", parm);
	}
	
	public int insertNotify(NotifyDTO dto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("category", dto.getCategory());
		parm.put("c_no",dto.getC_no());
		parm.put("email", dto.getEmail());
		return sst.insert("Notify.insertNotify",parm);
	}
	
	public int notifyCount(String category, int c_no) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("category", category);
		parm.put("c_no",c_no);
		return sst.selectOne("Notify.notifyCount",parm);
	}

}

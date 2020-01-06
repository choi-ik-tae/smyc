package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MembersDTO;

@Repository
public class MembersDAO {
	
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public int insert(MembersDTO dto) {
		Map<String ,String >parm = new HashMap<>();
		parm.put("email",dto.getEmail());
		parm.put("pw",dto.getPw());
		parm.put("name",dto.getName());
		parm.put("nickname",dto.getNickname());
		parm.put("phone",dto.getPhone());
		parm.put("gender",dto.getGender());
		
		return sst.insert("Members.insert",parm);
	}
	
	public int updateAuthkey(MembersDTO dto) {
		Map<String,String> parm = new HashMap<String, String>();
		parm.put("email", dto.getEmail());
		parm.put("authkey",dto.getAuthkey());
		
		return sst.update("Members.updateAuthkey",parm);
		
		
	}


}

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
	
	public int updateAhthStatus(String email) {
		return sst.update("Members.updateAuthStatus",email);
	}
	
	public MembersDTO checkNickName(String nickname) {
		return sst.selectOne("Members.checkNickName", nickname);
	}
	
	public MembersDTO loginOk(String email, String pw) {
		Map<String ,String >parm = new HashMap<String, String>();
		parm.put("email",email);
		parm.put("pw",pw);
		return sst.selectOne("Members.logInOk",parm);
	}
	
	public int returnAuthStatus(String email) {
		return sst.selectOne("Members.returnAuthStatus",email);
	}
	
	public String returnNickname(String email) {
		return sst.selectOne("Members.returnNickname", email);
	}
	
	public String findEmail(String name, String phone) {
		Map<String ,String >parm = new HashMap<String, String>();
		parm.put("name",name);
		parm.put("phone",phone);
		return sst.selectOne("Members.findEmail", parm);
	}


}

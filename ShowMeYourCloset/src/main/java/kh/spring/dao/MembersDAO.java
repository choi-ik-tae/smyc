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
	
//	멤바 등록
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
	
//	권한 키 업데이트
	public int updateAuthkey(MembersDTO dto) {
		Map<String,String> parm = new HashMap<String, String>();
		parm.put("email", dto.getEmail());
		parm.put("authkey",dto.getAuthkey());
		
		return sst.update("Members.updateAuthkey",parm);
	}
	
//	권한 업데이트 권한 줘야 로그인 됨
	public int updateAhthStatus(String email) {
		return sst.update("Members.updateAuthStatus",email);
	}
	
//	닉네임 중복 체크
	public MembersDTO checkNickName(String nickname) {
		return sst.selectOne("Members.checkNickName", nickname);
	}
	
//	로그인 확인
	public MembersDTO loginOk(String email, String pw) {
		Map<String ,String >parm = new HashMap<String, String>();
		parm.put("email",email);
		parm.put("pw",pw);
		return sst.selectOne("Members.logInOk",parm);
	}
	
	
//	권한 가져오기
	public int returnAuthStatus(String email) {
		return sst.selectOne("Members.returnAuthStatus",email);
	}
	
//	닉네임 가져오기
	public String returnNickname(String email) {
		return sst.selectOne("Members.returnNickname", email);
	}
	
//	이메일 찾기
	public String findEmail(String name, String phone) {
		Map<String ,String >parm = new HashMap<String, String>();
		parm.put("name",name);
		parm.put("phone",phone);
		return sst.selectOne("Members.findEmail", parm);
	}
	
//	비밀번호 변경
	public int changePwProc(String email, String pw) {
		Map<String, String> parm = new HashMap<String, String>();
		parm.put("email",email);
		parm.put("pw",pw);
		
		return sst.update("Members.changePwProc",parm);
	}
	
	// 회원 정보 가져오기
	public MembersDTO selectDTO(String email) {
		return sst.selectOne("Members.selectDTO",email);
	}
	
	// 회원 탈퇴
	public int withDraw(String email) {
		return sst.delete("Members.withDraw",email);
	}
	
	//회원 수정
	public int modify(MembersDTO dto) {
		Map<String ,String >parm = new HashMap<>();
		parm.put("email",dto.getEmail());
		parm.put("pw",dto.getPw());
		parm.put("name",dto.getName());
		parm.put("nickname",dto.getNickname());
		parm.put("phone",dto.getPhone());
		parm.put("gender",dto.getGender());
		
		return sst.update("Members.Infomodify",parm);
	}
	
	public String selectGender(String email) {
		return sst.selectOne("Members.selectGender", email);	
	}


}

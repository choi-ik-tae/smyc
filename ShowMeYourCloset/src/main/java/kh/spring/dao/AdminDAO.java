package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.AdminDTO;
import kh.spring.dto.BoardDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 총 회원
	public int selectMembers() {
		return sst.selectOne("Admin.selectMembers");
	}
	// 남자
	public int selectMemByM() {
		return sst.selectOne("Admin.selectMemByM");
	}
	// 여자
	public int selectMemByW() {
		return sst.selectOne("Admin.selectMemByW");
	}
	
	public List<BoardDTO> selectByBoastByView() {
		return sst.selectList("Admin.selectByBoastByView");
	}
	
	public List<BoardDTO> selectByHelpByView() {
		return sst.selectList("Admin.selectByHelpByView");
	}
	// 좋아요순 자랑게시글 출력
	public List<Integer> selectByBoastNoByLike() {
		return sst.selectList("Admin.selectByBoastNoByLike");
	}
	public BoardDTO selectByBoastByNo(int no) {
		return sst.selectOne("Admin.selectByBoastByNo",no);
	}
	public int selectLikeByBoastNo(int b_no) {
		return sst.selectOne("Admin.selectLikeByBoastNo",b_no);
	}
	public AdminDTO adminLogin(String email, String pw) {
		Map<String, String> parm = new HashMap<>();
		parm.put("id", email);
		parm.put("pw", pw);
		
		return sst.selectOne("Admin.adminLogin", parm);
	}
	
	
}

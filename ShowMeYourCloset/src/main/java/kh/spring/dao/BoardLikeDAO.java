package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardLikeDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	// 좋아요 클릭
	public int likeAdd(int b_no,String email) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("b_no",b_no);
		parm.put("email",email);
		
		return sst.insert("Like.likeAdd",parm);
	}
	// 좋아요 취소
	public int likeCancel(int b_no,String email) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("b_no",b_no);
		parm.put("email",email);
		
		return sst.delete("Like.likeCancel",parm);
	}
	// 좋아요 카운트
	public int likeCount(int b_no) {
		return sst.selectOne("Like.likeCount",b_no);
	}
	// 좋아요 클릭 여부
	public int likeClicked(int b_no,String email) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("b_no",b_no);
		parm.put("email",email);
		
		return sst.selectOne("Like.likeClicked",parm);
	}
	// 삭제된 게시물 좋아요 다 취소
	public int likeDelete(int b_no) {
		return sst.delete("Like.likeDelete",b_no);
	}
	
	
}

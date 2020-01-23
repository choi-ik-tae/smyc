package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CommentDTO;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<CommentDTO> commentsAll(int b_no){
		return sst.selectList("Comments.commentsAll", b_no);	
	}
	
	public int commentInsert(CommentDTO dto) {
		Map<String,Object> parm = new HashMap<>();
		parm.put("b_no",dto.getB_no());
		parm.put("email",dto.getEmail());
		parm.put("nickname",dto.getNickname());
		parm.put("contents",dto.getContents());
		return sst.insert("Comments.commentInsert",parm);
	}
	
	public int commentDelete(int no) {
		return sst.delete("Comments.commentDelete", no);
	}
	
	// 자랑게시글 댓글 바로 출력
	public List<CommentDTO> selectByEmail(int b_no,String email) {
		Map<String,Object> parm = new HashMap<>();
		parm.put("b_no",b_no);
		parm.put("email",email);
		
		return sst.selectList("Comments.selectByEmail",parm);
	}
	//게시글 삭제 시 관련 댓글 삭제
	public int boardDelete(int no) {
		return sst.delete("Comments.boardDelete",no);
	}
	// 모든 댓글 가져오기
	public List<CommentDTO> commentsSelectAllByEmail(String email) {
		return sst.selectList("Comments.commentsSelectAllByEmail",email);
	}
}

package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CommentDAO;
import kh.spring.dto.CommentDTO;

@Service
public class CommentsService {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public List<CommentDTO> commentsAll(int b_no){
		return commentDAO.commentsAll(b_no); 
	}
	
	public void commentInsert(CommentDTO dto) {
		commentDAO.commentInsert(dto);
	}
	
	public void commentDelete(int no) {
		commentDAO.commentDelete(no);
	}
	
	// 자랑게시판 댓글 바로 출력
	public List<CommentDTO> commentLast(int b_no,String email) {
		return commentDAO.selectByEmail(b_no,email);
	}
}

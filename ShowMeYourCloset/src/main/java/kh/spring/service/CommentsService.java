package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardDAO;
import kh.spring.dao.CommentDAO;
import kh.spring.dto.CommentDTO;

@Service
public class CommentsService {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private BoardDAO bdao;
	
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
	//게시글 삭제 시 관련 댓글 삭제
	public void boardDelete(int no) {
		commentDAO.boardDelete(no);
	}
	// 모든 댓글 가져오기
	public List<CommentDTO> commentsSelectAllByEmail(String email) {
		return commentDAO.commentsSelectAllByEmail(email);
	}
	// 댓글 원문이 무슨 게시물인지 판별
	public String commentsByBoard(int no) {
		return bdao.selectCategory(no);
	}
}

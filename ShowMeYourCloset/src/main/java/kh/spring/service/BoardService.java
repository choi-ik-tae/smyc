package kh.spring.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.Utils.Configuration;
import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;

	// help 전체 글 가져오기
	public List<BoardDTO> helpBoardSelectAll() {
		return boardDAO.helpBoardSelectAll();
	}

	// help 삽입
	public void helpBoardInsert(BoardDTO dto) {
		boardDAO.helpBoardInsert(dto);
	}

	public BoardDTO helpBoardDetailPage(int no){
		return boardDAO.helpBoardDetailPage(no);
	}
	
	public List<BoardDTO> selectByPage(int start, int end) {
		return boardDAO.selectByPage(start, end);
	}
}

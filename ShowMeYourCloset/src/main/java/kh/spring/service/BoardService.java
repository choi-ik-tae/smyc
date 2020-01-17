package kh.spring.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.Utils.Configuration;
import kh.spring.dao.BoardDAO;
import kh.spring.dao.DressDAO;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.DressDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Autowired
	private DressDAO ddao;
	
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
	
	// 자랑게시판 업로드 - 선택한 옷 정보 가져오기
	public DressDTO dressInfo(String path) {
		return ddao.pathDetailDress(path);
	}

}

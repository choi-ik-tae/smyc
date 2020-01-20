package kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardDAO;
import kh.spring.dao.BoardLikeDAO;
import kh.spring.dao.DressDAO;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.DressDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Autowired
	private DressDAO ddao;
	
	@Autowired
	private BoardLikeDAO ldao;

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
	
	public List<BoardDTO> helpBoardSearch(int start, int end , String search){
		return boardDAO.helpBoardSearch(start, end, search);
	}
	
	public List<BoardDTO> helpBoardAllSearch(String search){
		return boardDAO.helpBoardAllSearch(search);
	}
	
	// 자랑게시판 업로드 - 선택한 옷 정보 가져오기
	public DressDTO dressInfo(String path) {
		return ddao.pathDetailDress(path);
	}
	// 자랑게시판 등록
	public int boastBoardInsert(BoardDTO dto) {
		return boardDAO.boastBoardInsert(dto);
	}
	// 자랑게시판 글 출력
	public List<BoardDTO> boastSelectAll() {
		return boardDAO.boastSelectAll();
	}
	// 자랑게시판 게시물 선택
	public BoardDTO boastSeletctByNo(int no) {
		return boardDAO.boastSelectByNo(no);
	}
	// 자랑게시판 게시글 삭제
	public int boastDelete(int s_no) {
		return boardDAO.boastDelete(s_no);
	}
	// 좋아요 카운트
	public int boastLikeCount(int b_no) {
		return ldao.likeCount(b_no);
	}
	// 좋아요 클릭
	public int boastLikeAdd(int b_no,String email) {
		return ldao.likeAdd(b_no, email);
	}
	// 좋아요 취소
	public int boastLikeCancel(int b_no,String email) {
		return ldao.likeCancel(b_no, email);
	}
	// 좋아요 클릭 여부
	public int boastLikeClicked(int b_no,String email) {
		return ldao.likeClicked(b_no, email);
	}
	// 자랑게시판 카테고리 별 재 정렬
	public List<BoardDTO> boastAlign(String target) {
		List<BoardDTO> result = null;
		if(target.contentEquals("new")) {
			result = boardDAO.boastSelectNew();
		} else if(target.contentEquals("trendy")) {
			result = boardDAO.boastSelectTrendy();
		} else if(target.contentEquals("popular")) {
			List<BoardDTO> boast = new ArrayList<>();
			List<Integer> nos = boardDAO.boastSelectPopular();
			for(int tmp : nos) {
				boast.add(boardDAO.boastSelectByNo(tmp));
			}
			result = boast;
		} else if(target.contentEquals("random")) {
			result = boardDAO.boastSelectRandom();
		}
		return result;
	}
}

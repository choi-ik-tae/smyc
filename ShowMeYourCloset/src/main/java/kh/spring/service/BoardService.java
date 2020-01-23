package kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.Utils.Configuration;
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
	public void helpBoardUpdate(String title, String contents, int no) {
		boardDAO.helpBoardUpdate(title, contents, no);
	}
	public void helpBoardDelete(int no) {
		boardDAO.helpBoardDelete(no);
	}
	public String helpSearchGetPageNavi(int currentPage,int size ,int naviCountPerPage , int recordCountPerPage,String search) throws Exception {		
		int recordTotalCount = size; // DB에서 총 컬럼 수 불려오는 함수로 변경

		int pageTotalCount = 0;

		if (recordTotalCount % Configuration.recordCountPerPage > 0) {
			// 총 글의 개수를 페이지당 보여줄 개수로 나누었을 때, 나머지가 생기면
			// 총 페이지의 개수 + 1
			// ex) 143 / 10 = 14 이고 나머지가 3이니 페이지는 총 15개가 되어야한다. 그래서 +1
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		// 현재 내가 위치하는 페이지
		// int currentPage = 2;

		// 현재 페이지 번호가 비정상 값일 때, 조정하는 보안 코드
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// 현재 내가 위치하고 있는 페이지에 따라 네비게이터 시작 페이지 값을 구하는 공식
		int startNavi = ((currentPage - 1) / Configuration.naviCountPerPage) * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi +  Configuration.naviCountPerPage - 1;

		// 페이지 끝 값이 비정상 값일 때, 조정하는 보안 코드
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		// 이전과 이후가 필요한지 안한지 조정
		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();
		if (needPrev) {
			sb.append("<a href='/board/helpSearch?cpage=" + (startNavi - 1) + "&search="+search+"'>< </a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/board/helpSearch?cpage=" + i + "&search="+search+"'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if (needNext) {
			sb.append("<a href='/board/helpSearch?cpage=" + (endNavi + 1) + "&search="+search+"'> ></a>");
		}

		return sb.toString();
	}
	// 조회수 증가
	public int viewCountPlus(int no) {
		return boardDAO.viewCountPlus(no);
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
	@Transactional("txManager")
	public void boastDelete(int no) {
		boardDAO.boastDelete(no);
		ldao.likeDelete(no);
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
	// 자랑게시판 검색
	public List<BoardDTO> boastBoardSearchAll(String keyWord) {
		return boardDAO.boastBoardSearchAll(keyWord);
	}
	// 자랑게시글 중복 등록 검사
	public BoardDTO boastIsExist(int s_no) {
		return boardDAO.boastIsExist(s_no);
	}
	// 자랑게시물 내용 수정
	public int boastModify(int no,String title,String contents) {
		return boardDAO.boastModify(no,title,contents);
	}
	public List<BoardDTO> myBoastSelectAll(String email){
		return boardDAO.myBoastSelectAll(email);
	}
	public List<BoardDTO> myHelpSelectAll(String email){
		return boardDAO.myHelpSelectAll(email);
	}
}

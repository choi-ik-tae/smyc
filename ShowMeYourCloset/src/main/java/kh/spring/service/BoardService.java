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
	public String checkTime(Date time) {
		return "";
	}

	public String checkXss(String contents) {
		String replaceContents = contents.replaceAll("&", "&amp;");
		replaceContents = replaceContents.replaceAll("'", "&#x27;");
		replaceContents = replaceContents.replaceAll("\"", "&quot;");
		replaceContents = replaceContents.replaceAll("<", "&lt;");
		replaceContents = replaceContents.replaceAll(">", "&gt;");
		replaceContents = replaceContents.replaceAll("/", "&#x2F;");

		return replaceContents;
	}
	
	public List<BoardDTO> selectByPage(int start, int end) {
		return boardDAO.selectByPage(start, end);
	}
	

	// 페이지 네비게이터
	public String getPageNavi(int currentPage,int size) throws Exception {
		// 게시판 내의 총 글의 개수
		
		int recordTotalCount = size; // DB에서 총 컬럼 수 불려오는 함수로 변경
		// 한 페이지에 몇개의 글을 보여줄 지 설정
		// int recordCountPerPage = 10;
		// 한 페이지에서 몇개의 네비게이터를 보여줄 지 설정
		// int naviCountPerPage = 10;
		// 총 몇개의 페이지 인지.
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
			sb.append("<a href='/board/helpBoard?cpage=" + (startNavi - 1) + "'>< </a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/board/helpBoard?cpage=" + i + "'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if (needNext) {
			sb.append("<a href='/board/helpBoard?cpage=" + (endNavi + 1) + "'> ></a>");
		}

//	      System.out.println("현재 페이지 번호 : " + currentPage);
//	      System.out.println("네비게이터 시작 번호 : " + startNavi);
//	      System.out.println("네비게이터 끝 번호 : " + endNavi);

		return sb.toString();
	}
	
	// 자랑게시판 업로드 - 선택한 옷 정보 가져오기
	public DressDTO dressInfo(String path) {
		return ddao.pathDetailDress(path);
	}
	
	
}

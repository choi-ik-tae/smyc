package kh.spring.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.Utils.CheckXss;
import kh.spring.Utils.Configuration;
import kh.spring.Utils.DateFormat;
import kh.spring.Utils.NavigatorUtil;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.dto.StyleDTO;
import kh.spring.service.BoardService;
import kh.spring.service.ClosetService;
import kh.spring.service.MemberService;
import kh.spring.service.StyleService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private StyleService styleService;
	
	@Autowired
	private ClosetService cloService;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private HttpSession session;

	// help 게시판으로 가기
	@RequestMapping("/helpBoard")
	public String helpBoard(Model model, String cpage) {

		List<BoardDTO> allList = boardService.helpBoardSelectAll();
		String page = null;
		try {
			if (cpage == null) {
				cpage = 1 + "";
				page = NavigatorUtil.getPageNavi(1, allList.size(),10,15);
			} else {
				page = NavigatorUtil.getPageNavi(Integer.parseInt(cpage), allList.size(),10,15);
			}

			int start = (Integer.parseInt(cpage) * Configuration.recordCountPerPage) - Configuration.recordCountPerPage - 1;
			int end = Integer.parseInt(cpage) * Configuration.recordCountPerPage;

			List<BoardDTO> list = boardService.selectByPage(start, end);
			for (BoardDTO dto : list) {
				dto.setWrite_date(DateFormat.dateformat(dto.getWrite_date()));
			}
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/help/helpMain";
	}

	// help게시판 게시글 등록
	@RequestMapping("/helpUploadProc.do")
	public String helpUploadProc(BoardDTO dto) {
		String email = (String) session.getAttribute("email");
		String nick = (String) session.getAttribute("nick");

		String contents = CheckXss.checkXss(dto.getContents());
		String title = CheckXss.checkXss(dto.getTitle());

		dto.setContents(contents);
		dto.setTitle(title);
		dto.setEmail(email);
		dto.setNickname(nick);

		boardService.helpBoardInsert(dto);

		return "redirect:/board/helpBoard";
	}
	
	// help게시판 디테일
	@RequestMapping("/helpDetail")
	public String helpDetail(Model model,int no) {
		System.out.println(no);
		BoardDTO dto = boardService.helpBoardDetailPage(no);
		try {
			dto.setWrite_date(DateFormat.dateformat(dto.getWrite_date()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("dto", dto);
		return "board/help/helpBoardDetail";		
	}
	
	@RequestMapping("/helpSearch")
	public String helpSearch(Model model,String search, String cpage) {
		List<BoardDTO> allList = boardService.helpBoardAllSearch(search);
		String page = null;
		try {
			if (cpage == null) {
				cpage = 1 + "";
				page = NavigatorUtil.getPageNavi(1, allList.size(),10,15);
			} else {
				page = NavigatorUtil.getPageNavi(Integer.parseInt(cpage), allList.size(),10,15);
			}

			int start = (Integer.parseInt(cpage) * Configuration.recordCountPerPage) - Configuration.recordCountPerPage - 1;
			int end = Integer.parseInt(cpage) * Configuration.recordCountPerPage;

			List<BoardDTO> list = boardService.helpBoardSearch(start, end, search);
			for (BoardDTO dto : list) {
				dto.setWrite_date(DateFormat.dateformat(dto.getWrite_date()));
			}
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/help/helpMain";
	
	}
	
	// 자랑게시판 메인
	@RequestMapping("/boastBoard")
	public String boastBoard(Model m) {
		String email = (String)session.getAttribute("email");
		// 자랑게시판 게시물 총 출력
		List<BoardDTO> boastList = boardService.boastSelectAll();
		List<StyleDTO> styleList = new ArrayList<>();
		for(BoardDTO tmp : boastList) {
			styleList.add(styleService.detailStyle(tmp.getS_no()));
		}
		for(StyleDTO dto : styleList) {
			if(dto.getTop() == null && dto.getPants()==null && dto.getAcc() ==null && dto.getShoes()==null) {
				styleService.styleDelete(dto.getNo());
				boardService.boastDelete(dto.getNo());
			}
		}
		boastList = boardService.boastSelectAll();
		System.out.println(boastList.size());

		m.addAttribute("boastList", boastList);
		m.addAttribute("styleList", styleList);
		m.addAttribute("email", email);
		
		return "board/boast/boastMain";
	}
	// 자랑게시판 업로드 페이지
	@RequestMapping("/boastUpload")
	public String boastUpload(Model m,int no) {
		String email = (String)session.getAttribute("email");
		if(email == null) {
			System.out.println("끄지라!");
			return "redirec:/";
		}

		String gender = memService.selectGender(email);
		StyleDTO style = styleService.detailStyle(no);

		m.addAttribute("email",email);
		m.addAttribute("style", style);
		m.addAttribute("gender", gender);
		
		return "board/boast/boastUpload";
	}
	// 자랑게시판 업로드 - 선택한 옷 정보 ajax 가져오기
	@RequestMapping("/selectDressInfo")
	@ResponseBody
	public List<Map<String, Object>> selectDressInfo(String path) {
		DressDTO item = boardService.dressInfo(path);
		DressImgDTO itemImg = cloService.dressSelectImg(item.getNo());
		String[] season = cloService.splitDressSeason(item.getNo());
		
		List<Map<String, Object>> jsonList = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dressInfo", item);
		map.put("dressImg", itemImg);
		map.put("season", season);
		jsonList.add(map);
		
		return jsonList;
	}
	// 자랑게시판 업로드 실행
	@RequestMapping("/boastUploadProc")
	public String boastUploadProc(BoardDTO dto) {
		String email = (String) session.getAttribute("email");
		String nick = (String) session.getAttribute("nick");
		
		String contents = CheckXss.checkXss(dto.getContents());
		String title = CheckXss.checkXss(dto.getTitle());
		
		dto.setS_no(dto.getS_no());
		dto.setContents(contents);
		dto.setTitle(title);
		dto.setEmail(email);
		dto.setNickname(nick);
		
		boardService.boastBoardInsert(dto);
		
		return "redirect:/";
	}

}

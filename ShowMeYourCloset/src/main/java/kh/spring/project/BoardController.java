package kh.spring.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.Utils.CheckXss;
import kh.spring.Utils.Configuration;
import kh.spring.Utils.NavigatorUtil;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.CommentDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.dto.StyleDTO;
import kh.spring.service.AdvisorService;
import kh.spring.service.BoardService;
import kh.spring.service.ClosetService;
import kh.spring.service.CommentsService;
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
	private CommentsService comService;
	
	@Autowired
	private AdvisorService advisorService;
	
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
			
			int start = (Integer.parseInt(cpage) * Configuration.recordCountPerPage) - Configuration.recordCountPerPage + 1;
			int end = Integer.parseInt(cpage) * Configuration.recordCountPerPage;

			List<BoardDTO> list = boardService.selectByPage(start, end);
			
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("cpage",cpage);
			
		} catch (Exception e) {e.printStackTrace();}
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
	public String helpDetail(Model model,int no, String cpage ,String target ) {
		System.out.println(cpage + " : "+ no);
		BoardDTO dto = boardService.helpBoardDetailPage(no);
		boardService.viewCountPlus(no);
		

			
	
		
		if(cpage == null) {
			cpage= 1+"";
		}
		
		model.addAttribute("target", target);
		model.addAttribute("dto", dto);
		model.addAttribute("cpage",cpage);
		
		return "board/help/helpBoardDetail";		
	}
	// help게시판 검색
	@RequestMapping("/helpSearch")
	public String helpSearch(Model model,String search, String cpage) {
		List<BoardDTO> allList = boardService.helpBoardAllSearch(search);
	
		String page = null;
		try {
			if (cpage == null) {
				cpage = 1 + "";
				page = boardService.helpSearchGetPageNavi(1, allList.size(),10,15,search);
			} else {
				page = boardService.helpSearchGetPageNavi(Integer.parseInt(cpage), allList.size(),10,15,search);
			}

			int start = (Integer.parseInt(cpage) * Configuration.recordCountPerPage) - Configuration.recordCountPerPage + 1;
			int end = Integer.parseInt(cpage) * Configuration.recordCountPerPage;

			List<BoardDTO> list = boardService.helpBoardSearch(start, end, search);
			
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/help/helpMain";
	}
	// help 게시판 수정
	@RequestMapping("/modifyHelpBoard")
	public String modifyHelpBoard(String title, String contents, int no) {
		contents = contents.replaceAll("<br>", "\n");
		
		boardService.helpBoardUpdate(title, contents, no);
		
		return "redirect:/board/helpDetail?no="+no;		
	}
	//help게시판 삭제
	@RequestMapping("/deleteHelpBoard")
	public String deleteHelpBoard(int no) {
	
		boardService.helpBoardDelete(no);
		comService.boardDelete(no);
		advisorService.helpBoardDelete(no);
		
		return "redirect:/board/helpBoard";
		
	}
	// 자랑게시판 메인
	@RequestMapping("/boastBoard")
	public String boastBoard(String Atarget,Model m) {
		if(Atarget == null) {
			Atarget = "new";
		}
		String email = (String)session.getAttribute("email");
		// 자랑게시판 게시물 총 출력
		List<BoardDTO> boastList = boardService.boastAlign(Atarget);
		System.out.println(boastList.size());
		List<StyleDTO> styleList = new ArrayList<>();
		for(BoardDTO tmp : boastList) {
			styleList.add(styleService.detailStyle(tmp.getS_no()));
		}
		// 옷 삭제되었을때 자랑게시물 및 코디 지우기
		for(StyleDTO dto : styleList) {
			if(dto.getTop() == null && dto.getPants()==null && dto.getAcc() ==null && dto.getShoes()==null) {
				styleService.styleDelete(dto.getNo());
				boardService.boastDelete(dto.getNo());
			}
		}
		styleList.clear();
		// 지운거 반영해서 다시 호출
		boastList = boardService.boastAlign(Atarget);
		List<Integer> likeList = new ArrayList<>();
		for(BoardDTO tmp : boastList) {
			styleList.add(styleService.detailStyle(tmp.getS_no()));
			likeList.add(boardService.boastLikeCount(tmp.getNo()));
		}
		m.addAttribute("boastList", boastList);
		m.addAttribute("styleList", styleList);
		m.addAttribute("email", email);
		m.addAttribute("likeList", likeList);
		m.addAttribute("target", Atarget);
		
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
	public String boastUploadProc(BoardDTO dto, Model m) {
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

		return "redirect:/board/boastBoard";
	}
	// 자랑게시판 게시물 디테일
	@RequestMapping("/boastDetailView")
	public String boastDetailView(String Dtarget,Model m) {
		String email = (String)session.getAttribute("email");
		if(email == null) {
			System.out.println("끄지라!");
			return "redirec:/";
		}		
		String item = Dtarget.substring(5, Dtarget.length());
		int no = Integer.parseInt(item);
		if(boardService.boastSeletctByNo(no) == null) {
			return "error";
		}
		// 조회수 증가
		boardService.viewCountPlus(no);
		BoardDTO boast = boardService.boastSeletctByNo(no);
		int s_no = boardService.boastSeletctByNo(no).getS_no();
		String gender = memService.selectGender(email);
		StyleDTO style = styleService.detailStyle(s_no);
		int likeCliked = boardService.boastLikeClicked(boast.getNo(),email);
		List<CommentDTO> comments = comService.commentsAll(boast.getNo());
		String[] season = style.getSeason().split(",");
		
		m.addAttribute("email",email);
		m.addAttribute("style", style);
		m.addAttribute("gender", gender);
		m.addAttribute("season",season);
		m.addAttribute("boast", boast);
		m.addAttribute("likeCliked", likeCliked);
		m.addAttribute("comments", comments);
		
		return "board/boast/boastDetailView";
	}
	// 자랑게시판 좋아요 클릭
	@RequestMapping("/likeClick")
	@ResponseBody
	public String likeClick(String val,int no) {
		String email = (String)session.getAttribute("email");
		String target = null;
		if(val.contentEquals("btnLikeB")) {
			boardService.boastLikeAdd(no, email);
			target = "btnLikeA";
		}else {
			boardService.boastLikeCancel(no, email);
			target = "btnLikeB";
		}
		return target;
	}
	// 자랑게시판 검색
	@RequestMapping("/boastSearch")
	public String boastBoardSearchAll(String keyWord,Model m) {
		String email = (String)session.getAttribute("email");
		List<BoardDTO> boastList = boardService.boastBoardSearchAll(keyWord);
		List<StyleDTO> styleList = new ArrayList<>();
		for(BoardDTO tmp : boastList) {
			styleList.add(styleService.detailStyle(tmp.getS_no()));
		}
		// 옷 삭제되었을때 자랑게시물 및 코디 지우기
		for(StyleDTO dto : styleList) {
			if(dto.getTop() == null && dto.getPants()==null && dto.getAcc() ==null && dto.getShoes()==null) {
				styleService.styleDelete(dto.getNo());
				boardService.boastDelete(dto.getNo());
			}
		}
		styleList.clear();
		// 지운거 반영해서 다시 호출
		boastList = boardService.boastBoardSearchAll(keyWord);
		List<Integer> likeList = new ArrayList<>();
		for(BoardDTO tmp : boastList) {
			styleList.add(styleService.detailStyle(tmp.getS_no()));
			likeList.add(boardService.boastLikeCount(tmp.getNo()));
		}
		
		m.addAttribute("boastList", boastList);
		m.addAttribute("styleList", styleList);
		m.addAttribute("email", email);
		m.addAttribute("likeList", likeList);
		
		return "board/boast/boastSearch";
	}
	// 자랑게시물 중복 검사
	@RequestMapping("/boastIsExist")
	@ResponseBody
	public String boastIsExist(String s_no) {
		BoardDTO result = boardService.boastIsExist(Integer.parseInt(s_no));
		if(result != null) {
			return "be";
		}
		return "clean";
	}
	// 자랑게시물 삭제
	@RequestMapping("/boastDelete")
	public String boastDelete(int no) {
		boardService.boastDelete(no);
		return "redirect:/board/boastBoard";
	}
	// 자랑게시물 수정 페이지 이동
	@RequestMapping("/boastModify")
	public String boastModify(int no,Model m) {
		String email = (String)session.getAttribute("email");
		if(email == null) {
			return "redirec:/signin";
		}		
		BoardDTO boast = boardService.boastSeletctByNo(no);
		int s_no = boardService.boastSeletctByNo(no).getS_no();
		String gender = memService.selectGender(email);
		StyleDTO style = styleService.detailStyle(s_no);
		int likeCliked = boardService.boastLikeClicked(boast.getNo(),email);
		List<CommentDTO> comments = comService.commentsAll(boast.getNo());
		String[] season = style.getSeason().split(",");
		
		m.addAttribute("email",email);
		m.addAttribute("style", style);
		m.addAttribute("gender", gender);
		m.addAttribute("season",season);
		m.addAttribute("boast", boast);
		m.addAttribute("likeCliked", likeCliked);
		m.addAttribute("comments", comments);
		
		return "board/boast/boastModify";
	}
	// 자랑게시물 수정 실행
	@RequestMapping("/boastModifyProc")
	public String boastModifyProc(int no,String bTitle, String contents,Model m) {
		boardService.boastModify(no, bTitle, contents);
		String Dtarget = "boast"+no;
		m.addAttribute("Dtarget", Dtarget);
		return "redirect:/board/boastDetailView";
	}
	// 내가 쓴 글 
	@RequestMapping("/myBoard")
	public String myBoard(Model model) {
		String email= (String) session.getAttribute("email");
		List<BoardDTO> helpList = boardService.myHelpSelectAll(email);
		List<BoardDTO> boastList = boardService.myBoastSelectAll(email);
		List<StyleDTO> styleList = new ArrayList<>();
		for(BoardDTO tmp : boastList) {
			styleList.add(styleService.detailStyle(tmp.getS_no()));
		}
		// 옷 삭제되었을때 자랑게시물 및 코디 지우기
		for(StyleDTO dto : styleList) {
			if(dto.getTop() == null && dto.getPants()==null && dto.getAcc() ==null && dto.getShoes()==null) {
				styleService.styleDelete(dto.getNo());
				boardService.boastDelete(dto.getNo());
			}
		}
		styleList.clear();
		// 지운거 반영해서 다시 호출
		boastList = boardService.myBoastSelectAll(email);
		List<Integer> likeList = new ArrayList<>();
		for(BoardDTO tmp : boastList) {
			styleList.add(styleService.detailStyle(tmp.getS_no()));
			likeList.add(boardService.boastLikeCount(tmp.getNo()));
		}
		
		model.addAttribute("boastList", boastList);
		model.addAttribute("styleList", styleList);
		model.addAttribute("helpList", helpList);
		model.addAttribute("likeList", likeList);
		
		return "board/my/myBoard";
	}
}

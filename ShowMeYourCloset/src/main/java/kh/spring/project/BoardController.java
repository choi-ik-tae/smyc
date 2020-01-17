package kh.spring.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.Utils.Configuration;
import kh.spring.Utils.DateFormat;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.StyleDTO;
import kh.spring.service.BoardService;
import kh.spring.service.StyleService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private StyleService styleService;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("/helpBoard")
	public String helpBoard(Model model, String cpage) {

		List<BoardDTO> allList = boardService.helpBoardSelectAll();
		String page = null;
		try {
			if (cpage == null) {
				cpage = 1 + "";
				page = boardService.getPageNavi(1, allList.size());
			} else {
				page = boardService.getPageNavi(Integer.parseInt(cpage), allList.size());
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

	@RequestMapping("/helpUploadProc.do")
	public String helpUploadProc(BoardDTO dto) {
		String email = (String) session.getAttribute("email");
		String nick = (String) session.getAttribute("nick");

		String contents = boardService.checkXss(dto.getContents());
		String title = boardService.checkXss(dto.getTitle());

		dto.setContents(contents);
		dto.setTitle(title);
		dto.setEmail(email);
		dto.setNickname(nick);

		boardService.helpBoardInsert(dto);

		return "redirect:/board/helpBoard";
	}
	
	@RequestMapping("/helpDetail")
	public String helpDetail(Model model,int no) {
		System.out.println(no);
		BoardDTO dto = boardService.helpBoardDetailPage(no);
		model.addAttribute("dto", dto);
		return "board/help/helpBoardDetail";		
	}
	
	@RequestMapping("/boastBoard")
	public String boastBoard(Model m) {
		String email = (String)session.getAttribute("email");
		
		List<StyleDTO> styleList = styleService.selectAll(email);
		for(StyleDTO dto : styleList) {
			if(dto.getTop() == null && dto.getPants()==null && dto.getAcc() ==null && dto.getShoes()==null) {
				styleService.styleDelete(dto.getNo());
			}
		}
		
		m.addAttribute("styleList", styleList);
		m.addAttribute("email", email);
		
		return "board/boast/boastMain";
	}

	@RequestMapping("/boastUpload")
	public String boastUpload(Model m,int no) {
		String email = (String)session.getAttribute("email");
		if(email == null) {
			System.out.println("끄지라!");
			return "redirec:/";
		}
		
		List<StyleDTO> styleList = styleService.selectAll(email);
		for(StyleDTO dto : styleList) {
			if(dto.getTop() == null && dto.getPants()==null && dto.getAcc() ==null && dto.getShoes()==null) {
				styleService.styleDelete(dto.getNo());
			}
		}

		
		m.addAttribute("email",email);
		m.addAttribute("styleList", styleList);
		
		
		return "board/boast/boastUpload";
	}

}

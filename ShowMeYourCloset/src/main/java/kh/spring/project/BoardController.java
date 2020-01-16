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
import kh.spring.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

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
			System.out.println(list.get(0).getWrite_date());
			for (BoardDTO dto : list) {
				dto.setWrite_date(DateFormat.dateformat(dto.getWrite_date()));
				System.out.println(dto.getWrite_date());
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
	
	@RequestMapping("/boastBoard")
	public String boastBoard() {
		return "board/boast/boastMain";
	}
}

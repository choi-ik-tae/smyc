package kh.spring.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.BoardDTO;
import kh.spring.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/helpBoard")
	public String helpBoard(Model model) {
		List<BoardDTO> list = boardService.helpBoardSelectAll();
		model.addAttribute("list", list);
		
		return "board/help/helpMain";
	}

}

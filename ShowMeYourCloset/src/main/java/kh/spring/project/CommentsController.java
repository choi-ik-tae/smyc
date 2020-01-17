package kh.spring.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comments")
public class CommentsController {
	
	@RequestMapping("/helpBoardComments")
	public String helpBoardComments() {
		
		return "board/help/helpBoardnomalComment";
	}

}

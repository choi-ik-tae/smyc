package kh.spring.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.Utils.CheckXss;
import kh.spring.dto.CommentDTO;
import kh.spring.service.BoardService;
import kh.spring.service.CommentsService;

@Controller
@RequestMapping("/comments")
public class CommentsController {

	@Autowired
	private CommentsService comService;

	@Autowired
	private BoardService bService;
	
	@Autowired
	private HttpSession session;

	// help 게시판 디테일 댓글 전체 리스트 ...!
	@RequestMapping("/helpBoardComments")
	public String helpBoardComments(Model model, int b_no) {
		List<CommentDTO> list = comService.commentsAll(b_no);
		
		model.addAttribute("list", list);
		model.addAttribute("b_no", b_no);
		
		return "board/help/helpBoardnomalComment";
	}

	@RequestMapping("/commentUpload")
	@ResponseBody
	public String commentUpload(int b_no, String contents) {
		CommentDTO dto = new CommentDTO();
		String email = (String) session.getAttribute("email");
		String nickname = (String) session.getAttribute("nick");

		dto.setEmail(email);
		dto.setNickname(nickname);
		dto.setB_no(b_no);
		contents = CheckXss.checkXss(contents);
		dto.setContents(contents);

		comService.commentInsert(dto);

		return "good";
	}
	
	@RequestMapping("/deleteCommentsProc")
	public String deleteCommentsProc(int no, int b_no) {
		comService.commentDelete(no);
		return "redirect:/comments/helpBoardComments?b_no="+b_no;		
	}
	
	// 자랑게시판 댓글
	@RequestMapping("/boastCommentInsert")
	@ResponseBody
	public List<CommentDTO> boastComments(int b_no,String contents) {
		CommentDTO dto = new CommentDTO();
		String email = (String) session.getAttribute("email");
		String nickname = (String) session.getAttribute("nick");

		dto.setEmail(email);
		dto.setNickname(nickname);
		dto.setB_no(b_no);
		contents = CheckXss.checkXss(contents);
		dto.setContents(contents);
		// 댓글 입력
		comService.commentInsert(dto);
		// 입력한 댓글 뽑아오기
		List<CommentDTO> cm = comService.commentLast(b_no,email);
		List<CommentDTO> jsonList = new ArrayList<>();
		if(cm.size() > 0) {
			for(CommentDTO tmp : cm) {
				jsonList.add(tmp);
			}
		}
		return jsonList;
	}
	// 자랑게시판 댓글 삭제
	@RequestMapping("/boastCommentDelete")
	@ResponseBody
	public void boastCommentInsert(int target) {
		comService.commentDelete(target);
	}
	// 내가 작성한 댓글
	@RequestMapping("/myComments")
	public String myComments(Model m) {
		String email = (String) session.getAttribute("email");
		List<CommentDTO> Comments = comService.commentsSelectAllByEmail(email);
		m.addAttribute("Comments", Comments);
		return "board/my/myComments";
	}
	// 댓글 원문으로 이동
	@RequestMapping("/toBoard")
	public String toBoard(String no,Model m) {
		int target = Integer.parseInt((no.substring(4, no.length())));
		String category = bService.selectCategory(target);
		
		String loc = null;
		String Dtarget = "boast"+target;
		
		if(category.contentEquals("B")) {
			m.addAttribute("Dtarget", Dtarget);
			m.addAttribute("back", "my");
			loc = "redirect:/board/boastDetailView";
		} else {
			m.addAttribute("no", target);
			m.addAttribute("cpage", 1);
			m.addAttribute("target", "my");
			loc = "redirect:/board/helpDetail";
		}
		return loc;
	}
	
}

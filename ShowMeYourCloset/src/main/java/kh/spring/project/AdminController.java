package kh.spring.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.BoardDTO;
import kh.spring.dto.MembersDTO;
import kh.spring.service.AdminService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminService adService;
	
	@Autowired
	private MemberService memService;
	
	@RequestMapping("/adminMain")
	public String adminMain(String email, String pw) {
		try {
			System.out.println(email + " : "+pw);
			int check=adService.adminLogin(email, pw);
			if(check == 1) {
				session.setAttribute("admin", email);
				return "admin/adminMain";
			}else {
				System.out.println("마! 관리자도 아닌게... 끄지라!");
				return "redirect:/";
			}
		}catch(Exception e) {
			return "error";
		}
	}
	
	@RequestMapping("/chart")
	public String chart(Model m) {
		int mem = adService.selectMembers();
		int memM = adService.selectMemByM();
		int memW = adService.selectMemByW();
		List<BoardDTO> boastboard = adService.selectByBoastByView();
		List<BoardDTO> helpboard = adService.selectByHelpByView();
		List<Integer> boastNoByLike = adService.selectByBoastNoByLike();
		
		List<BoardDTO> boastByLike = new ArrayList<>();
		List<String> boastTitleByLike = new ArrayList<>();
		List<Integer> boastLike = new ArrayList<>();
		
		if(boastNoByLike.size() > 0) {
			for(int tmp : boastNoByLike) {
				boastByLike.add(adService.selectByBoastByNo(tmp));
			}
			if(boastByLike != null) {
				for(BoardDTO tmp : boastByLike) {
					System.out.println(tmp.getTitle());
					boastTitleByLike.add("'"+tmp.getTitle()+"'");
					boastLike.add(adService.selectLikeByBoastNo(tmp.getNo()));
				}
			}
		}
		
		List<Integer> memList = new ArrayList<>();
		memList.add(mem);
		memList.add(memM);
		memList.add(memW);
		List<String> boastTitle = new ArrayList<>();
		List<String> boastView = new ArrayList<>();
		for(BoardDTO tmp : boastboard) {
			boastTitle.add("'"+tmp.getTitle()+"'");
			boastView.add(tmp.getViews());
		}
		List<String> helpTitle = new ArrayList<>();
		List<String> helpView = new ArrayList<>();
		for(BoardDTO tmp : helpboard) {
			helpTitle.add("'"+tmp.getTitle()+"'");
			helpView.add(tmp.getViews());
		}
		
		m.addAttribute("memList", memList);
		m.addAttribute("boastTitle", boastTitle);
		m.addAttribute("boastView", boastView);
		m.addAttribute("helpTitle", helpTitle);
		m.addAttribute("helpView", helpView);
		m.addAttribute("boastTitleByLike", boastTitleByLike);
		m.addAttribute("boastLike", boastLike);
		
		return "admin/chart";
	}
	
	@RequestMapping("/block")
	public String block(Model model) {
		List<MembersDTO> list = memService.selectAll();
		model.addAttribute("list", list);
		return "admin/block";
	}
	
	@RequestMapping("/blockProc")
	@ResponseBody
	public String blockProc(String email, String ban) {
		memService.memberBan(email, ban);
		return ban;		
	}
	
}

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

import kh.spring.dto.BoardDTO;
import kh.spring.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminService adService;
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/chart")
	public String chart(Model m) {
		int mem = adService.selectMembers();
		int memM = adService.selectMemByM();
		int memW = adService.selectMemByW();
		List<BoardDTO> boastboard = adService.selectByBoastByView();
		List<BoardDTO> helpboard = adService.selectByHelpByView();
		
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
		
		return "admin/chart";
	}
	
	@RequestMapping("/block")
	public String block() {
		return "admin/block";
	}
	
}

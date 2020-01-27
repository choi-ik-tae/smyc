package kh.spring.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/chart")
	public String chart() {
		return "admin/chart";
	}
	
	@RequestMapping("/block")
	public String block() {
		return "admin/block";
	}
	
}

package kh.spring.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String home() {

		return "index";
	}

	@RequestMapping("/signup")
	public String signup() {
		return "login/signup";
	}

	@RequestMapping("/signin")
	public String signin() {
		
		return "login/signin";

	}
	
	@RequestMapping("/clothesUpload")
	public String clothesUpload() {
		
		return "member/closet/clothesUpload";
	}
	
}

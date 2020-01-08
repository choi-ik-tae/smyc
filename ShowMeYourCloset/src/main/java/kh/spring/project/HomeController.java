package kh.spring.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ClosetDTO;
import kh.spring.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private HttpSession session;
	
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
	
	@RequestMapping("/dressUpload")
	public String clothesUpload(Model m) {
		String email = (String)session.getAttribute("email");
		List<ClosetDTO> list = memService.closetSeleteNoByEmail(email);
		m.addAttribute("list", list);
		
		return "member/closet/dressUpload";
	}
	
	@RequestMapping("/myCloset")
	public String myCloset() {
		String email = (String)session.getAttribute("email");
		
		return "member/closet/myCloset";
	}
	
	@RequestMapping("myInfo")
	public String myInfo() {
		return "member/info/myInfo";
	}
	
	@RequestMapping("myStyle")
	public String myStyle() {
		return "member/style/myStyle";
	}
	
	@RequestMapping("/closetUpload")
	public String closetUpload() {
		return "member/closet/closetUpload";
	}
	
	@RequestMapping("/idFind")
	public String idFind() {
		return "login/idFind";
	}
	
	@RequestMapping("/pwFind")
	public String pwFind() {
		return "login/pwFind";
	}
	
	@RequestMapping("/pwChange")
	public String pwChange(Model model,String email) {
		model.addAttribute("email", email);
		return "login/pwChange";
	}

}

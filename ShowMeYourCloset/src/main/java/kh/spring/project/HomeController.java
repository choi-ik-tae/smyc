package kh.spring.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.dto.StyleDTO;
import kh.spring.service.ClosetService;
import kh.spring.service.MemberService;
import kh.spring.service.StyleService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private ClosetService cloService;
	
	@Autowired
	private StyleService styleService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String home(Model m) {		
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
	
	// 옷 등록 이동시 옷장 정보 가져가기
	@RequestMapping("/dressUpload")
	public String clothesUpload(Model m) {
		String email = (String)session.getAttribute("email");
		List<ClosetDTO> list = cloService.closetSeleteByEmail(email);
		m.addAttribute("list", list);
		
		return "mypage/closet/dressUpload";
	}
	
	@RequestMapping("/dressDetailView")
	public String dressModify(int c_no,int d_no,Model m) {
		System.out.println("잘 도착!");
		
		DressDTO info = cloService.dressSelectInfo(d_no);
		DressImgDTO img = cloService.dressSelectImg(d_no);
		ClosetDTO closet = cloService.closetSelectName(c_no);
		String[] season = cloService.splitDressSeason(d_no);
		
		m.addAttribute("info", info);
		m.addAttribute("img", img);
		m.addAttribute("closet", closet);
		m.addAttribute("season", season);
				
		return "mypage/closet/dressDetailView";
	}
	
	@RequestMapping("myCloset")
	public String myCloset() {
		return "redirect:closet/myCloset";
	}
	
	@RequestMapping("/myInfo")
	public String myInfo() {
		return "mypage/info/myInfo";
	}
	
	@RequestMapping("/myStyle")
	public String myStyle(Model model, String season) {
		String email = (String)session.getAttribute("email");
		
		List<StyleDTO> styleList =null;
		if(season ==null || season.equals("all")) {
			 styleList =styleService.selectAll(email);
		}else {
			styleList = styleService.selectSeason(email, season);
		}
		
		model.addAttribute("styleList", styleList);
				
		return "mypage/style/myStyle";
	}
	
	// 옷장 추가 등록
	@RequestMapping("/closetUpload")
	public String closetUpload() {
		return "mypage/closet/closetUpload";
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
	
	@RequestMapping("/styleUpload")
	public String styleUpload(Model model) {
		String email = (String) session.getAttribute("email");
		String gender = memService.selectGender(email);
		model.addAttribute("gender", gender);
		return "mypage/style/styleUpload";
	}
	// 에러페이지 이동
	@RequestMapping("/error")
	public String error() {
		return "error";
	}
}

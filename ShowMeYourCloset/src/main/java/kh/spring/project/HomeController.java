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
import kh.spring.service.ClosetService;
import kh.spring.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private ClosetService cloService;
	
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
		List<ClosetDTO> list = cloService.closetSeleteNoByEmail(email);
		m.addAttribute("list", list);
		
		return "mypage/closet/dressUpload";
	}
	
	// 내 옷장 가기 전 옷장,옷 정보 가져가기
	@RequestMapping("/myCloset")
	public String myCloset(Model m) {
		String email = (String)session.getAttribute("email");
		String target = "기본옷장";
		// 선택에 따른 옷장 정보 리스트 default 기본옷장으로 선택
		ClosetDTO closet = cloService.closetSelectByName(target);
		List<DressDTO> dressList = cloService.dressSelectByCloset(closet.getNo());
		// 각각의 옷 정보들
		List<DressDTO> topList = cloService.dressSelectByCategory("top", closet.getNo());
		List<DressDTO> pantsList = cloService.dressSelectByCategory("pants", closet.getNo());
		List<DressDTO> shoesList = cloService.dressSelectByCategory("shoes", closet.getNo());
		List<DressDTO> accList = cloService.dressSelectByCategory("acc", closet.getNo());
		// 각각의 옷 이미지
		List<DressImgDTO> topImgList = cloService.topImgSelect(target, "top");
		List<DressImgDTO> pantsImgList = cloService.pantsImgSelect(target, "pants");
		List<DressImgDTO> shoesImgList = cloService.shoesImgSelect(target, "shoes");
		List<DressImgDTO> accImgList = cloService.accImgSelect(target, "acc");
		// 사용자 옷 이미지
		List<String> dressImgList = cloService.selectByEmail(email);
		
		m.addAttribute("closetNo", closet.getNo());
		m.addAttribute("img", closet.getImg());
		m.addAttribute("dressList", dressList);
		m.addAttribute("dressImgList", dressImgList);
		m.addAttribute("topList", topList);
		m.addAttribute("pantsList", pantsList);
		m.addAttribute("shoesList", shoesList);
		m.addAttribute("accList", accList);
		m.addAttribute("topImgList", topImgList);
		m.addAttribute("pantsImgList", pantsImgList);
		m.addAttribute("shoesImgList", shoesImgList);
		m.addAttribute("accImgList", accImgList);
		
		return "mypage/closet/myCloset";
	}
	
	@RequestMapping("myInfo")
	public String myInfo() {
		return "mypage/info/myInfo";
	}
	
	@RequestMapping("myStyle")
	public String myStyle() {
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
	
	//지울거예요~~!
	@RequestMapping("/styleUpload")
	public String styleUpload() {
		return "mypage/style/styleUpload";
	}

}

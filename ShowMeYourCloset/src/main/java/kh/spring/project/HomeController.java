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
		List<ClosetDTO> list = cloService.closetSeleteByEmail(email);
		m.addAttribute("list", list);
		
		return "mypage/closet/dressUpload";
	}
	
	// 내 옷장 가기 전 옷장,옷 정보 가져가기
	@RequestMapping("/myCloset")
	public String myCloset(Model m,String target) {
		String email = (String)session.getAttribute("email");
		if(target == null) {
			target="기본옷장";
		}
		// 사용자 옷장 정보 가져가기
		List<ClosetDTO> closetList = cloService.closetSeleteByEmail(email);
		
		// 선택에 따른 옷장 정보 리스트 default 기본옷장으로 선택
		ClosetDTO closet = cloService.closetSelectByName(target,email);
		List<DressDTO> dressList = cloService.dressSelectByCloset(closet.getNo());
		List<String> dressImgList = cloService.selectImgByEmail(email,closet.getNo());

		// 각각의 옷 정보들
		List<DressDTO> topList = cloService.dressSelectByCategory(email,"Top", closet.getNo());
		List<DressDTO> pantsList = cloService.dressSelectByCategory(email,"Pants", closet.getNo());
		List<DressDTO> shoesList = cloService.dressSelectByCategory(email,"Shoes", closet.getNo());
		List<DressDTO> accList = cloService.dressSelectByCategory(email,"Acc", closet.getNo());
		// 각각의 옷 이미지
		List<DressImgDTO> topImgList = cloService.targetImgSelect(email,closet.getNo(),"Top");
		List<DressImgDTO> pantsImgList = cloService.targetImgSelect(email,closet.getNo(),"Pants");
		List<DressImgDTO> shoesImgList = cloService.targetImgSelect(email,closet.getNo(),"Shoes");
		List<DressImgDTO> accImgList = cloService.targetImgSelect(email,closet.getNo(),"Acc");
		
		m.addAttribute("closetList", closetList);
		m.addAttribute("closetNo", closet.getNo());
		m.addAttribute("target", target);
		m.addAttribute("img", closet.getImg());
		m.addAttribute("dressImgList", dressImgList);
		m.addAttribute("topList", topList);
		m.addAttribute("pantsList", pantsList);
		m.addAttribute("shoesList", shoesList);
		m.addAttribute("accList", accList);
		m.addAttribute("topImgList", topImgList);
		m.addAttribute("pantsImgList", pantsImgList);
		m.addAttribute("shoesImgList", shoesImgList);
		m.addAttribute("accImgList", accImgList);
		m.addAttribute("dressList", dressList);
		
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

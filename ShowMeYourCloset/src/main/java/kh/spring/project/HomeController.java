package kh.spring.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.Utils.DateFormat;
import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.dto.StyleDTO;
import kh.spring.service.BoardService;
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
	private BoardService boardService;
	
	@Autowired
	private HttpSession session;

	// 홈
	@RequestMapping("/")
	public String home(Model m, HttpServletRequest request) {
		String ip=request.getRemoteAddr();
		
		return "index";
	}

	// 회원가입
	@RequestMapping("/signup")
	public String signup() {
		return "login/signup";
	}

	// 로그인
	@RequestMapping("/signin")
	public String signin() {
		return "login/signin";
	}

	// 옷 등록 이동시 옷장 정보 가져가기
	@RequestMapping("/dressUpload")
	public String clothesUpload(Model m) {
		String email = (String) session.getAttribute("email");
		List<ClosetDTO> list = cloService.closetSeleteByEmail(email);
		m.addAttribute("list", list);

		return "mypage/closet/dressUpload";
	}

	// 옷 디테일 뷰
	@RequestMapping("/dressDetailView")
	public String dressModify(int c_no, int d_no, Model m) {

		DressDTO info = cloService.dressSelectInfo(d_no);
		DressImgDTO img = cloService.dressSelectImg(d_no);
		ClosetDTO closet = cloService.closetSelectName(c_no);
		String[] season = cloService.splitDressSeason(d_no);
		String day = null;
		try {
			day = DateFormat.dateformat(info.getBuy_date());
		} catch (Exception e) {
			day = null;
		}
		
		m.addAttribute("info", info);
		m.addAttribute("img", img);
		m.addAttribute("closet", closet);
		m.addAttribute("season", season);
		m.addAttribute("day", day);

		return "mypage/closet/dressDetailView";
	}

	// 옷 정보 수정 시 데이터 가져가기
	@RequestMapping("/dressModify")
	public String dressModify(int no, Model m) {
		String email = (String) session.getAttribute("email");
		DressDTO info = cloService.dressSelectInfo(no);
		DressImgDTO infoImg = cloService.dressSelectImg(no);
		List<ClosetDTO> closet = cloService.closetSeleteByEmail(email);
		String[] season = cloService.splitDressSeason(no);

		m.addAttribute("info", info);
		m.addAttribute("infoImg", infoImg);
		m.addAttribute("closet", closet);
		m.addAttribute("season", season);

		return "mypage/closet/dressModify";
	}

	// 내 옷장 이동
	@RequestMapping("myCloset")
	public String myCloset() {
		return "redirect:closet/myCloset";
	}

	// 내 정보 이동
	@RequestMapping("/myInfo")
	public String myInfo() {
		return "mypage/info/myInfo";
	}

	// 내 코디 이동
	@RequestMapping("/myStyle")
	public String myStyle(Model model, String season) {
		String email = (String) session.getAttribute("email");

		if (email != null) {
			List<StyleDTO> styleList = styleService.selectAll(email);
			for(StyleDTO dto : styleList) {
				if(dto.getTop() == null && dto.getPants()==null && dto.getAcc() ==null && dto.getShoes()==null) {
					styleService.styleDelete(dto.getNo());
					boardService.boastDelete(dto.getNo());
				}
			}
			if (season == null || season.equals("all")) {
				styleList = styleService.selectAll(email);
			} else {
				styleList = styleService.selectSeason(email, season);	
			}
			model.addAttribute("styleList", styleList);
		}
		
		
		
		return "mypage/style/myStyle";
	}

	// 옷장 추가 등록
	@RequestMapping("/closetUpload")
	public String closetUpload() {
		return "mypage/closet/closetUpload";
	}

	// 아이디 찾기
	@RequestMapping("/idFind")
	public String idFind() {
		return "login/idFind";
	}

	// 비밀번호 찾기
	@RequestMapping("/pwFind")
	public String pwFind() {
		return "login/pwFind";
	}

	// 비밀번호 변경
	@RequestMapping("/pwChange")
	public String pwChange(Model model, String email) {
		model.addAttribute("email", email);
		return "login/pwChange";
	}

	// 코디 업로드
	@RequestMapping("/styleUpload")
	public String styleUpload(Model model) {
		String email = (String) session.getAttribute("email");
		String gender = memService.selectGender(email);
		List<ClosetDTO> closetList = styleService.selectClosetAll(email);

		model.addAttribute("closetList", closetList);
		model.addAttribute("gender", gender);
		return "mypage/style/styleUpload";
	}

	// 에러페이지 이동
	@RequestMapping("/error")
	public String error() {
		return "error";
	}

	@RequestMapping("/errorFile")
	public String errorFile() {
		return "errorFile";
	}
	
	@RequestMapping("/helpUpload")
	public String helpUpload() {
		return "board/help/helpBoardUpload";
	}
}

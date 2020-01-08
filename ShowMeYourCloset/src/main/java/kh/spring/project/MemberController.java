package kh.spring.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.dto.MembersDTO;
import kh.spring.service.ClosetService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private ClosetService cloService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("signupProc")
	public String signup(Model model,MembersDTO dto,String phone1,String phone2,String phone3) {
		String phone = phone1+phone2+phone3;
		System.out.println(dto.getEmail());
		System.out.println(phone);
		System.out.println("성별 제대로? "+dto.getGender());
		dto.setPhone(phone);
		
		try {
			memService.create(dto);
			
			model.addAttribute("auth_check", 0);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "login/signupConfirm";
	}
	
	@RequestMapping("joinConfirm")
	public String joinConrim(Model model,String email,String authkey) {
		System.out.println(email);
		System.out.println(authkey);
		
		memService.updateAuth(email);
		
		
		model.addAttribute("auth_check", 1);
		
		return "login/signupConfirm";
	}
	
	@RequestMapping("signinProc")
	public String signup(Model model,String email,String pw) {
		System.out.println(email+"/"+pw);
		
		int result = memService.logInOk(email, pw);
		
		if(result > 0) {
			int auth = memService.returnAuthStatus(email);
			System.out.println(auth);
			if(auth == 1) {
				
				String nickname = memService.returnNickname(email);
				
				session.setAttribute("email", email);
				session.setAttribute("nick", nickname);
				
				return "redirect:/";
			}
			
		}
		model.addAttribute("result", result);
		
		return "trySignup";
		
	}
	
	// 옷 등록 및 이미지 등록
	@RequestMapping("/closet/dressUploadProc")
	public String clothesUpload(DressDTO dto,DressImgDTO fdto,MultipartFile file) {
		String email = (String)session.getAttribute("email");
		String nick = (String)session.getAttribute("nick");
		dto.setEmail(email);
		
		String path = session.getServletContext().getRealPath("files/"+nick);
		fdto.setPath(path);
		
		System.out.println(dto.toString());
		
		cloService.dressUpload(dto, fdto, file, path);
		
		return "redirect:/";
	}
	
	// 옷장 등록
	@RequestMapping("/closet/closetUploadProc")
	public String closetUpload(ClosetDTO dto) {
		String email = (String)session.getAttribute("email");
		dto.setEmail(email);
		
		System.out.println(dto.getImg());
		
		int result = cloService.closetUpload(dto);
		
		return "redirect:/"; 
	}

	@RequestMapping("nickCheckProc")
	@ResponseBody
	public String nickCheckProc(String nickname) {
		System.out.println(nickname);
		
		int result=memService.checkNickName(nickname);
		if(result >0) {
			return "done";
		}else {
			return "fail";
		}

	}
	
	@RequestMapping("logoutProc")
	public String logoutProc() {
		
		session.invalidate();
		
		return "redirect:/";
				
	}
	
	@RequestMapping(value="/idFindProc",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String idFindProc(String name, String phone) {
	
		String email=memService.findEmail(name, phone);
		if(email==null) {
			return "이메일이 존재하지 않습니다.";			
		}
		
		return email;
	}
	
	@RequestMapping("/findPWProc")
	public String findPWProc(Model model ,String email) {
		System.out.println("하하하하핳 :: "+email);
		
		try {
			String authkey=memService.sendFindPWEmail(email);
			
			model.addAttribute("authkey", authkey);
			model.addAttribute("email",email);
			
			return "login/pwConfirm";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
		
	}
	
	@RequestMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email) {
		System.out.println(email);
		
		String result = memService.returnNickname(email);
		if(result == null) {
			return "fail";
		}
		
		return "good";
	}
	
	@RequestMapping("/changePwProc")
	public String changePwProc(String pw,String email) {
		System.out.println(email + " : "+pw);
		
		memService.changePwProc(email, pw);
		
		return "login/pwChangeConfirm";
	}

}

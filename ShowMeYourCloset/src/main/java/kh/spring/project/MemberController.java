package kh.spring.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MembersDTO;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memService;
	
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
	public String signup(String email,String pw) {
		System.out.println(email+"/"+pw);
		
		return "";
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

}

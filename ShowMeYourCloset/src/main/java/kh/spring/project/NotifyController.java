package kh.spring.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.NotifyDTO;
import kh.spring.service.NotifyService;

@Controller
@RequestMapping("/notify")
public class NotifyController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private NotifyService notifyService;
	
	@RequestMapping("/notifyProc.do")
	@ResponseBody
	public String notifyProc(String category , int c_no) {
		
		String email = (String)session.getAttribute("email");
		
		String check = notifyService.checkNotify(category, c_no, email);
		if(check == null) {
			NotifyDTO dto = new NotifyDTO();
			dto.setCategory(category);
			dto.setEmail(email);
			dto.setC_no(c_no);
			notifyService.insertNotify(dto);
			return "good";
		}
		
		return "fail";		
	}

}

package kh.spring.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.AdvisorDTO;
import kh.spring.service.AdvisorService;

@Controller
@RequestMapping("/advisor")
public class AdvisorController {
	
	@Autowired
	private AdvisorService advisorService;
	
	@RequestMapping("/helpStyleComent")
	public String helpStyleComent(Model model,int b_no) {	
		List<AdvisorDTO> list = advisorService.selectAdvisorAll(b_no);
		model.addAttribute("list", list);		
		return "board/help/helpBoardStyleComent";
	}

}

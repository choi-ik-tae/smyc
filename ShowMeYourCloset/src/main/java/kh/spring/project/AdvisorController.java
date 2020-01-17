package kh.spring.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.Utils.Configuration;
import kh.spring.Utils.NavigatorUtil;
import kh.spring.dto.AdvisorDTO;
import kh.spring.service.AdvisorService;

@Controller
@RequestMapping("/advisor")
public class AdvisorController {
	
	@Autowired
	private AdvisorService advisorService;
	
	@RequestMapping("/helpStyleComent")
	public String helpStyleComent(Model model,String cpage,int b_no) {	
		List<AdvisorDTO> allList = advisorService.selectAdvisorAll(b_no);
		String page =null;
		try {
			if(cpage==null) {
				cpage = 1+"";
				page = NavigatorUtil.getPageNavi(1, allList.size(), 10, 6);
			}else {
				page = NavigatorUtil.getPageNavi(Integer.parseInt(cpage), allList.size(), 10, 6);
			}
			
			int start = (Integer.parseInt(cpage) * 6) - 6 - 1;
			int end = Integer.parseInt(cpage) * 6;
			
			List<AdvisorDTO> list = advisorService.selectByPage(start, end, b_no);
			model.addAttribute("list", list);
			model.addAttribute("page",page);			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		return "board/help/helpBoardStyleComent";
	}

}

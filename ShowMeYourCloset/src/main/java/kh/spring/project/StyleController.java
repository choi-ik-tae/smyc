package kh.spring.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.StyleDTO;
import kh.spring.service.MemberService;
import kh.spring.service.StyleService;

@Controller
@RequestMapping("/style")
public class StyleController {
	
	@Autowired
	private StyleService sService;

	@Autowired
	private HttpSession session;
	
	@RequestMapping("/selectCategoryProc")
	@ResponseBody
	public List<Map<String,String>> selectCategoryProc(String category) {
		System.out.println(category);
	
		String email = (String) session.getAttribute("email");
		List<String> list = sService.selectCategoryAll(email, category);
		List<Map<String,String>> jsonList = new ArrayList<>();
		for(int i = 0; i<list.size();i++) {
			Map<String,String> map = new HashMap<String, String>();
			map.put("file",list.get(i));
			jsonList.add(map);
		}
		return jsonList;	
	}
	
	@RequestMapping("/insertProc")
	public String insertProc(Model model,StyleDTO dto) {
		if(dto.getTop()==null) { dto.setTop(null);}
		if(dto.getPants()==null) {dto.setPants(null);}
		if(dto.getShose()==null) {dto.setShose(null);}
		if(dto.getAcc()==null) {dto.setAcc(null);}
				
		sService.insert(dto);
		
		return "redirect:/myStyle";	
	}

}

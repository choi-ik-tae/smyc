package kh.spring.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.ClosetDTO;
import kh.spring.dto.StyleDTO;
import kh.spring.service.MemberService;
import kh.spring.service.StyleService;

@Controller
@RequestMapping("/style")
public class StyleController {
	
	@Autowired
	private StyleService sService;
	
	@Autowired
	private MemberService memService;

	@Autowired
	private HttpSession session;
	
	
	// 카테고리별 옷 끌고오기
	@RequestMapping("/selectCategoryProc")
	@ResponseBody
	public List<Map<String,String>> selectCategoryProc(String category,int c_no) {

		String email = (String) session.getAttribute("email");
		List<String> list = sService.selectCategoryAll(email, category,c_no);
		List<Map<String,String>> jsonList = new ArrayList<>();
		for(int i = 0; i<list.size();i++) {
			Map<String,String> map = new HashMap<String, String>();
			map.put("file",list.get(i));
			jsonList.add(map);
		}
		return jsonList;	
	}
	
	// 코디 등록	
	@RequestMapping("/insertProc")
	public String insertProc(Model model,StyleDTO dto) {
		if(dto.getTop()==null) { dto.setTop(null);}
		if(dto.getPants()==null) {dto.setPants(null);}
		if(dto.getShoes()==null) {dto.setShoes(null);}
		if(dto.getAcc()==null) {dto.setAcc(null);}
				
		sService.insert(dto);
		
		return "redirect:/myStyle";	
	}
	
	//코디 검색
	@RequestMapping("/searchStyle")
	public String searchStyle(Model model,String name) {
		
		String email = (String) session.getAttribute("email");
		List<StyleDTO> styleList=sService.searchStyle(name, email);
		model.addAttribute("styleList", styleList);
		
		return "mypage/style/myStyle";		
	}
	
	@RequestMapping("/detailStyle")
	public String detailStyle(Model model , int no) {		
		
		String email  = (String)session.getAttribute("email");
		
		String gender = memService.selectGender(email);
		StyleDTO dto = sService.detailStyle(no);
		String[] season = dto.getSeason().split(",");
		
		model.addAttribute("season",season);
		model.addAttribute("gender", gender);
		model.addAttribute("dto", dto);
			
		return "mypage/style/styleDetail";
	}
	
	@RequestMapping("/modifyPage")
	public String modifyPage(Model model, int no) {
		String email  = (String)session.getAttribute("email");
		
		String gender = memService.selectGender(email);
		StyleDTO dto = sService.detailStyle(no);
		String[] season = dto.getSeason().split(",");
		List<ClosetDTO> closetList= sService.selectClosetAll(email);
		
		model.addAttribute("closetList", closetList);
		model.addAttribute("season",season);
		model.addAttribute("gender", gender);
		model.addAttribute("dto", dto);
		return "mypage/style/styleModify";
		
	}
	
	@RequestMapping("/modifyProc")
	public String modifyProc(StyleDTO dto) {
		sService.styleModify(dto);
		
		return "redirect:/myStyle";
	}
	
	@RequestMapping("/styleDelete")
	public String styleDelete(int no) {
		
		sService.styleDelete(no);
		
		return "redirect:/myStyle";
	}

}

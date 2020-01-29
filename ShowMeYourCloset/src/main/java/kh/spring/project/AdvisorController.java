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

import kh.spring.Utils.CheckXss;
import kh.spring.dto.AdvisorDTO;
import kh.spring.dto.ClosetDTO;
import kh.spring.service.AdvisorService;
import kh.spring.service.ClosetService;
import kh.spring.service.MemberService;
import kh.spring.service.NotifyService;
import kh.spring.service.StyleService;

@Controller
@RequestMapping("/advisor")
public class AdvisorController {
	
	@Autowired
	private AdvisorService advisorService;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private StyleService styleService;
	
	@Autowired
	private ClosetService closetService;
	
	@Autowired
	private NotifyService notifyService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/helpStyleComent")
	public String helpStyleComent(Model model,String cpage,int b_no,String writer) {
	
		model.addAttribute("writer", writer);
		model.addAttribute("b_no", b_no);
		List<AdvisorDTO> allList = advisorService.selectAdvisorAll(b_no);
		int choice_no = 0;
		AdvisorDTO choiceDTO = null;
		
		for(int i = 0; i<allList.size();i++) {
			int count = notifyService.notifyCount("A", allList.get(i).getNo());
			if(count>4) {
				allList.remove(i);
				advisorService.deleteAdvisor(allList.get(i).getNo());
			}
		}
		
		if(cpage==null) {
			cpage = 1+"";
		}

		if(cpage.contentEquals("1")) {
			for(AdvisorDTO dto : allList) {
				if(dto.getChoice().equals("Y")) {
					choiceDTO = dto;
					choice_no = dto.getNo();
				}
			}
		}
	
		model.addAttribute("choiceDto", choiceDTO);
	
		String page =null;
		try {
			if(cpage.equals("1")) {
				page = advisorService.getPageNavi(1, allList.size(), 10, 6 ,b_no,writer);
			}else {
				page = advisorService.getPageNavi(Integer.parseInt(cpage), allList.size(), 10, 6,b_no,writer);
			}
			
			int start = (Integer.parseInt(cpage) * 6) - 6 + 1;
			int end = Integer.parseInt(cpage) * 6;
			
			List<AdvisorDTO> list = advisorService.selectByPage(start, end, b_no);
	
			for(int i = 0 ; i<list.size();i++) {
				if(list.get(i).getNo() == choice_no) {
					list.remove(i);
				}
			}
	
			model.addAttribute("list", list);
			model.addAttribute("page",page);			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		return "board/help/helpBoardStyleComent";
	}

	@RequestMapping("/advisorUpload")
	public String advisorUpload(Model model, String writer, int b_no ,String cpage) {
		String gender =memService.selectGender(writer);
		List<ClosetDTO> closetList = closetService.closetSeleteByEmail(writer);
		
		for(int i = 0; i<closetList.size();i++) {
			if(closetList.get(i).getPub().contentEquals("N")) {
				closetList.remove(i);
			}
		}
		
		model.addAttribute("b_no", b_no);
		model.addAttribute("closetList", closetList);
		model.addAttribute("gender", gender);
		model.addAttribute("writer", writer);
		model.addAttribute("cpage",cpage);
		return "board/help/helpAdvisorUpload";
		
	}
	
	@RequestMapping("/selectCategoryMenu")
	@ResponseBody
	public List<Map<String, String>> selectCategoryMenu(String category,int c_no,String writer) {
		List<String> list=styleService.selectPubCategoryAll(writer, category, c_no);		
		List<Map<String,String>> jsonList = new ArrayList<>();
		for(int i = 0; i<list.size();i++) {
			Map<String,String> map = new HashMap<String, String>();
			map.put("file",list.get(i));
			jsonList.add(map);
		}
		return jsonList;
	}
	
	@RequestMapping("/advisorUploadProc")
	public String advisorUploadProc(AdvisorDTO dto,String cpage) {
		String email = (String)session.getAttribute("email");
		String nickname = (String)session.getAttribute("nick");
		
		dto.setEmail(email);
		dto.setNickname(nickname);
		dto.setTitle(CheckXss.checkXss(dto.getTitle()));
		dto.setContents(CheckXss.checkXss(dto.getContents()));
		
		advisorService.insertAdivisor(dto);
		
		return "redirect:/board/helpDetail?no="+dto.getB_no()+"&cpage="+cpage;
		
	}
	
	@RequestMapping("/detailAdvisor")
	public String detailAdvisor(Model model,int no,String writer,String cpage) {
		AdvisorDTO dto = advisorService.selectAdvisorDTO(no);
		
		String gender = memService.selectGender(writer);
		
		model.addAttribute("gender", gender);
		model.addAttribute("writer", writer);
		model.addAttribute("dto",	dto);
		model.addAttribute("cpage",cpage);
		
		return "board/help/helpAdvisorDetail";
	}
	
	@RequestMapping("/choiceThisAdvisor")
	@ResponseBody
	public String choiceThisAdvisor(int no,int b_no) {
		List<AdvisorDTO> list = advisorService.selectAdvisorAll(b_no);
		
		for(AdvisorDTO dto  : list) {
			if(dto.getChoice().equals("Y")) {
				return "fail";
			}
		}
		
		advisorService.updateChoiceAdvisor("Y", no);
		
		return "good";
	}
	
	@RequestMapping("/choiceReturn")
	@ResponseBody
	public String choiceReturn(int no) {
		advisorService.updateChoiceAdvisor("N", no);
		return "";
	}
	
	@RequestMapping("/deleteAdvisor")
	public String deleteAdvisor(int no , int b_no) {
		advisorService.deleteAdvisor(no);
		return "redirect:/board/helpDetail?no="+b_no;
	}
	
	@RequestMapping("/advisorModify")
	public String advisorModify(Model model,int no, String gender, int cpage,String writer) {
		AdvisorDTO dto = advisorService.selectAdvisorDTO(no);
		
		List<ClosetDTO> closetList = closetService.closetSeleteByEmail(writer);
		
		for(int i = 0; i<closetList.size();i++) {
			if(closetList.get(i).getPub().contentEquals("N")) {
				closetList.remove(i);
			}
		}
		
		model.addAttribute("closetList", closetList);
		model.addAttribute("gender", gender);
		model.addAttribute("dto", dto);
		model.addAttribute("cpage",cpage);
		model.addAttribute("writer", writer);
		
		return "board/help/helpAdvisorModify";
	}
	
	@RequestMapping("/advisorModifyProc")
	public String advisorModifyProc(AdvisorDTO dto,String cpage) {
		
		System.out.println(dto.getTop() + " : "+dto.getPants());
		System.out.println("이건 내용 제목 :: "+dto.getTitle()+ " : "+dto.getContents());
		
		dto.setTitle(CheckXss.checkXss(dto.getTitle()));
		dto.setContents(CheckXss.checkXss(dto.getContents()));
		
		advisorService.modifyAdvisor(dto);
		
		return "redirect:/board/helpDetail?no="+dto.getB_no()+"&cpage="+cpage;
		
		
	}
}

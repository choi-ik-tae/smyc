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
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.service.ClosetService;

@Controller
@RequestMapping("/closet")
public class ClosetContoller {

	@Autowired
	private ClosetService cloService;
	
	@Autowired
	private HttpSession session;
	
	// 옷 등록 및 이미지 등록
	@RequestMapping("/dressUploadProc")
	public String clothesUpload(DressDTO dto, DressImgDTO fdto, MultipartFile file) {
		String email = (String) session.getAttribute("email");
		String nick = (String) session.getAttribute("nick");
		dto.setEmail(email);
		
		String path = session.getServletContext().getRealPath("files/" + nick);
		String rootPath = session.getServletContext().getRealPath("files");
		cloService.dressUpload(dto, fdto, file, path, nick, rootPath);

		return "redirect:/";
	}
	// 옷장 등록
	@RequestMapping("/closetUploadProc")
	public String closetUpload(ClosetDTO dto) {
		String email = (String) session.getAttribute("email");
		dto.setEmail(email);
		
		int result = cloService.closetUpload(dto);

		return "redirect:/";
	}
	// 내 옷장 조회
	@RequestMapping("myCloset")
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
		m.addAttribute("dressList", dressList);
		m.addAttribute("topList", topList);
		m.addAttribute("pantsList", pantsList);
		m.addAttribute("shoesList", shoesList);
		m.addAttribute("accList", accList);
		m.addAttribute("topImgList", topImgList);
		m.addAttribute("pantsImgList", pantsImgList);
		m.addAttribute("shoesImgList", shoesImgList);
		m.addAttribute("accImgList", accImgList);
		
		return "mypage/closet/myCloset";
	}
	// 전체 옷 정보 ajax 통신
	@RequestMapping("/allView")
	@ResponseBody
	public List<Map<String,Object>> allview(String closet,String email) {
		// 옷장 번호 받아온거 int형 변환
		int closetNo = Integer.parseInt(closet);
		List<DressDTO> dressList = cloService.dressSelectByCloset(closetNo);
		List<String> dressImgList = cloService.selectImgByEmail(email,closetNo);
		List<Map<String,Object>> jsonList = new ArrayList<>();
		
		if(!(dressList == null)) {
			for(int i = 0;i < dressList.size();i++) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("dress",dressList.get(i));
				map.put("dressImg",dressImgList.get(i));
				jsonList.add(map);
			}
		}
		return jsonList;
	}
	// 선택한 옷 정보 ajax 통신
	@RequestMapping("/targetView")
	@ResponseBody
	public List<Map<String,Object>> targetView(String closet,String email,String category) {		
		// 옷장 번호 받아온거 int형 변환
		int closetNo = Integer.parseInt(closet);
		List<DressDTO> dressList = cloService.dressSelectByCategory(email, category, closetNo);
		List<DressImgDTO> targetImgList = cloService.targetImgSelect(email, closetNo, category);
		List<Map<String,Object>> jsonList = new ArrayList<>();
		
		if(!(dressList == null)) {
			for(int i = 0;i < dressList.size();i++) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("dress",dressList.get(i));
				map.put("dressImg",targetImgList.get(i));
				jsonList.add(map);
			}
		}
		return jsonList;
	}
}

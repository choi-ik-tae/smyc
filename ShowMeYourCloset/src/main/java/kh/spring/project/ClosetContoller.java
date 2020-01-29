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

import kh.spring.Utils.CheckXss;
import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.dto.StyleDTO;
import kh.spring.service.ClosetService;
import kh.spring.service.StyleService;

@Controller
@RequestMapping("/closet")
public class ClosetContoller {

	@Autowired
	private ClosetService cloService;
	
	@Autowired
	private StyleService styleService;

	@Autowired
	private HttpSession session;

	// 옷 등록 및 이미지 등록
	@RequestMapping("/dressUploadProc")
	public String clothesUpload(DressDTO dto, DressImgDTO fdto, MultipartFile file) {
		String email = (String) session.getAttribute("email");
		String nick = (String) session.getAttribute("nick");
		dto.setEmail(email);
		// 스크립트 방지
		dto.setCategory(CheckXss.checkXss(dto.getCategory()));
		dto.setName(CheckXss.checkXss(dto.getName()));
		dto.setMemo(CheckXss.checkXss(dto.getMemo()));
		dto.setPrice(CheckXss.checkXss(dto.getPrice()));
		
		String path = session.getServletContext().getRealPath("files/" + nick);
		String rootPath = session.getServletContext().getRealPath("files");
		cloService.dressUpload(dto, fdto, file, path, nick, rootPath);
		
		return "redirect:/myCloset";
	}
	// 옷장 등록
	@RequestMapping("/closetUploadProc")
	public String closetUpload(ClosetDTO dto) {
		String email = (String) session.getAttribute("email");
		dto.setEmail(email);
		dto.setName(CheckXss.checkXss(dto.getName()));
		dto.setMemo(CheckXss.checkXss(dto.getMemo()));
		
		cloService.closetUpload(dto);

		return "redirect:/myCloset";
	}
	// 옷 정보 삭제
	@RequestMapping("/dressDelete")
	public String dressDetailView(int no) {
		try {
			String nick = (String) session.getAttribute("nick");
			String path = session.getServletContext().getRealPath("files/" + nick);
			String category = cloService.dressSelectInfo(no).getCategory();
			String itemPath = cloService.dressSelectImg(no).getPath();
			
			System.out.println("path : "+path);
			System.out.println("category : "+category);
			System.out.println("itemPath : "+itemPath);
			
			int result = cloService.dressDelete(no,path,category,itemPath);
			System.out.println(result);
			
			if(result == 0) {
				return "redirect:/errorFile";
			}
			return "redirect:/myCloset";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	// 옷 정보 수정
	@RequestMapping("/dressModifyProc")
	public String dressModify(DressDTO dto, DressImgDTO fdto, MultipartFile file) {
		String email = (String) session.getAttribute("email");
		String nick = (String) session.getAttribute("nick");
		dto.setEmail(email);
		// 스크립트 방지
		dto.setCategory(CheckXss.checkXss(dto.getCategory()));
		dto.setName(CheckXss.checkXss(dto.getName()));
		dto.setMemo(CheckXss.checkXss(dto.getMemo()));
		dto.setPrice(CheckXss.checkXss(dto.getPrice()));
		
		String path = session.getServletContext().getRealPath("files/" + nick);
		DressImgDTO img = cloService.dressSelectImg(dto.getNo());
		String itemSysName = img.getSys_name();
		
		if(file.getOriginalFilename() == "") {
			fdto.setSys_name(img.getSys_name());
			fdto.setOri_name(img.getOri_name());
		}

		cloService.dressModify(dto, fdto, file, path, nick, itemSysName);
		
		return "redirect:/myCloset";
	}	
	// 내 옷장 조회
	@RequestMapping("myCloset")
	public String myCloset(Model m, String target) {
		String email = (String) session.getAttribute("email");		
		if (email == null) { return "/mypage/closet/myCloset"; }
		if (cloService.closetSeleteByEmail(email).size() <= 0) { int closetEmpty = 1; m.addAttribute("closetEmpty", closetEmpty); return "/mypage/closet/myCloset"; }
		if (target == null) {
			List<String> base = cloService.closetSelectNameByEmail(email);
			target = CheckXss.checkXss(base.get(0));
		}
		// 스크립트 필터
		target = CheckXss.checkXss(target);
		
		// 사용자 옷장 정보 가져가기
		List<ClosetDTO> closetList = cloService.closetSeleteByEmail(email);

		// 선택에 따른 옷장 정보 리스트 default 기본옷장으로 선택
		ClosetDTO closet = cloService.closetSelectByName(target, email);
		List<DressDTO> dressList = cloService.dressSelectByCloset(closet.getNo());
		List<String> dressImgList = cloService.selectImgByEmail(email, closet.getNo());

		// 각각의 옷 정보들
		List<DressDTO> topList = cloService.dressSelectByCategory(email, "Top", closet.getNo());
		List<DressDTO> pantsList = cloService.dressSelectByCategory(email, "Pants", closet.getNo());
		List<DressDTO> shoesList = cloService.dressSelectByCategory(email, "Shoes", closet.getNo());
		List<DressDTO> accList = cloService.dressSelectByCategory(email, "Acc", closet.getNo());
		// 각각의 옷 이미지
		List<DressImgDTO> topImgList = cloService.targetImgSelect(email, closet.getNo(), "Top");
		List<DressImgDTO> pantsImgList = cloService.targetImgSelect(email, closet.getNo(), "Pants");
		List<DressImgDTO> shoesImgList = cloService.targetImgSelect(email, closet.getNo(), "Shoes");
		List<DressImgDTO> accImgList = cloService.targetImgSelect(email, closet.getNo(), "Acc");

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
	// 옷장 수정 모드
	@RequestMapping("/closetModify")
	public String closetModify(int c_no,Model m) {
		
		String email = (String) session.getAttribute("email");
		
		// 옷장 정보
		ClosetDTO closet = cloService.closetSelectName(c_no);
		// 각각의 옷 정보들
		List<DressDTO> topList = cloService.dressSelectByCategory(email, "Top", closet.getNo());
		List<DressDTO> pantsList = cloService.dressSelectByCategory(email, "Pants", closet.getNo());
		List<DressDTO> shoesList = cloService.dressSelectByCategory(email, "Shoes", closet.getNo());
		List<DressDTO> accList = cloService.dressSelectByCategory(email, "Acc", closet.getNo());
		// 각각의 옷 이미지
		List<DressImgDTO> topImgList = cloService.targetImgSelect(email, closet.getNo(), "Top");
		List<DressImgDTO> pantsImgList = cloService.targetImgSelect(email, closet.getNo(), "Pants");
		List<DressImgDTO> shoesImgList = cloService.targetImgSelect(email, closet.getNo(), "Shoes");
		List<DressImgDTO> accImgList = cloService.targetImgSelect(email, closet.getNo(), "Acc");
		
		m.addAttribute("closet", closet);
		m.addAttribute("topList", topList);
		m.addAttribute("pantsList", pantsList);
		m.addAttribute("shoesList", shoesList);
		m.addAttribute("accList", accList);
		m.addAttribute("topImgList", topImgList);
		m.addAttribute("pantsImgList", pantsImgList);
		m.addAttribute("shoesImgList", shoesImgList);
		m.addAttribute("accImgList", accImgList);
		
		return "mypage/closet/closetModify";
		
	}
	// 옷장 수정 - 수정완료
	@RequestMapping("closetModifyProc")
	public String closetModifyProc(String[] targets,int no, String closet, String dg,String pub,Model m) {
		try {
			List<Integer> nos = new ArrayList<>();
			for(String tmp : targets) {
				nos.add(Integer.parseInt(tmp));
			}
			String path = session.getServletContext().getRealPath("");
			cloService.closetDeleteDress(nos,path);
			cloService.closetUpdate(no, dg, CheckXss.checkXss(closet), pub);
			// 변경된 옷장 이름 보내주기 위함
			String target = CheckXss.checkXss(cloService.closetSelectName(no).getName());
			m.addAttribute("target", target);
			
			return "redirect:/myCloset";
		}catch(Exception e) {
			return "error";
		}
	}
	// 옷장 수정  - 수정삭제
	@RequestMapping("closetDeleteProc")
	public String closetDeleteProc(int no) {
		try {
			String email = (String)session.getAttribute("email");
			String path = session.getServletContext().getRealPath("");
			
			cloService.closetDelete(no, email, path);
		
			return "redirect:/myCloset";
		}catch(Exception e) {
			return "error";
		}
	}

	// 전체 옷 정보 ajax 통신
	@RequestMapping("/allView")
	@ResponseBody
	public List<Map<String, Object>> allview(String closet, String email) {
		// 옷장 번호 받아온거 int형 변환
		int closetNo = Integer.parseInt(closet);
		List<DressDTO> dressList = cloService.dressSelectByCloset(closetNo);
		List<String> dressImgList = cloService.selectImgByEmail(email, closetNo);
		List<Map<String, Object>> jsonList = new ArrayList<>();

		if (!(dressList == null)) {
			for (int i = 0; i < dressList.size(); i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("dress", dressList.get(i));
				map.put("dressImg", dressImgList.get(i));
				jsonList.add(map);
			}
		}
		return jsonList;
	}

	// 선택한 옷 정보 ajax 통신
	@RequestMapping("/targetView")
	@ResponseBody
	public List<Map<String, Object>> targetView(String closet, String email, String category) {
		// 옷장 번호 받아온거 int형 변환
		int closetNo = Integer.parseInt(closet);
		List<DressDTO> dressList = cloService.dressSelectByCategory(email, category, closetNo);
		List<DressImgDTO> targetImgList = cloService.targetImgSelect(email, closetNo, category);
		List<Map<String, Object>> jsonList = new ArrayList<>();

		if (!(dressList == null)) {
			for (int i = 0; i < dressList.size(); i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("dress", dressList.get(i));
				map.put("dressImg", targetImgList.get(i));
				jsonList.add(map);
			}
		}
		return jsonList;
	}

	// 이미지 경로를 통해서 옷 정보 가져오기
	@RequestMapping("/styleDetailDress")
	@ResponseBody
	public Map<String, Object> styleDetailDress(String path) {


		Map<String, Object> map = new HashMap<>();
		if (path != null) {
			DressDTO dto = cloService.pathDetailDress(path);
			map.put("no", dto.getNo());
			map.put("name", dto.getName());
			map.put("email", dto.getEmail());
			map.put("category", dto.getCategory());
			map.put("pub", dto.getPub());
			map.put("season", dto.getSeason());
			map.put("buy_date", dto.getBuy_date());
			map.put("memo", dto.getMemo());
			map.put("price", dto.getPrice());
		}

		return map;
	}
}

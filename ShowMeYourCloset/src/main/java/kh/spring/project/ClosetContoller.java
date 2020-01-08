package kh.spring.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		cloService.dressUpload(dto, fdto, file, path, nick);

		return "redirect:/";
	}

	// 옷장 등록
	@RequestMapping("/closetUploadProc")
	public String closetUpload(ClosetDTO dto) {
		String email = (String) session.getAttribute("email");
		dto.setEmail(email);

		System.out.println(dto.getImg());

		int result = cloService.closetUpload(dto);

		return "redirect:/";
	}
	
}

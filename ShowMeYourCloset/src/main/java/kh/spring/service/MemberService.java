package kh.spring.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.confirm.MailUtils;
import kh.spring.confirm.TempKey;
import kh.spring.dao.ClosetDAO;
import kh.spring.dao.DressDAO;
import kh.spring.dao.MembersDAO;
import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.dto.MembersDTO;


@Service
public class MemberService {
	
	@Autowired
	private MembersDAO mdao;
	
	@Autowired
	private DressDAO ddao;

	@Autowired
	private ClosetDAO cdao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Transactional("txManager")
	public void create(MembersDTO dto) throws Exception {
		mdao.insert(dto);
		
		
		String authkey = new TempKey().getKey(50, false);
		
		dto.setAuthkey(authkey);
		mdao.updateAuthkey(dto);
		
		MailUtils sendMail = new MailUtils(mailSender);
		
		System.out.println(dto.getEmail());
		sendMail.setSubject("[ShowMeYourCloset] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>이메일 인증</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료 됩니다.</p>")
				.append("<a href='http://192.168.60.11/member/joinConfirm?email=")
				.append(dto.getEmail())
				.append("' target='_blenk'>이메일 인증 확인 </a>")
				.toString());
		sendMail.setFrom("codud966@gmail.com", "[ShowMeYourCloset]");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	
		
	}
	
	public String sendFindPWEmail(String email) throws Exception {
		
		String authkey = new TempKey().getKey(8, false);
		
		
		System.out.println("암호 발급 키 :: "+authkey);
		
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[ShowMeYourCloset] 비밀번호 찾기");
		sendMail.setText(new StringBuffer().append("<h1>비밀번호 인증</h1>")
				.append("<p>아래 숫자를 입력해주세요</p>")
				.append("<h3>")
				.append(authkey)
				.append("</h3>")
				.toString());
		sendMail.setFrom("codud966@gmail.com", "[ShowMeYourCloset]");
		sendMail.setTo(email);
		sendMail.send();
		
		return authkey;
	}
	
	public void updateAuth(String email) {
		
		mdao.updateAhthStatus(email);
	}
	
	public int checkNickName(String nickname) {
		MembersDTO dto = mdao.checkNickName(nickname);
		int result = 0 ;
		if(dto == null) {
			result = 1;
		}
		
		return result;
	}
	
	public int logInOk(String email, String pw) {
		
		MembersDTO dto =mdao.loginOk(email, pw);
		int result = 1;
		if(dto == null) {
			result = 0;
		}
		
		return result;
	}
	
	public int returnAuthStatus(String email) {
		int authstatus = mdao.returnAuthStatus(email);
		
		return authstatus;
		
	}
	
	public String returnNickname(String email) {
		
		return mdao.returnNickname(email);
	}

	
	public String findEmail(String name, String phone) {
		
		String email = mdao.findEmail(name, phone);
		
		return email;
	}
	
	// 옷장 등록
	public int closetUpload(ClosetDTO dto) {
		return cdao.insert(dto);
	}
	// 옷장 번호 및 이미지 가져오기
	public List<ClosetDTO> closetSeleteNoByEmail(String email) {
		return cdao.selectNoByEmail(email);
	}
	
	// 옷 등록
	@Transactional("txManager")
	public void dressUpload(DressDTO dto,DressImgDTO fdto,MultipartFile file,String path) {
		int result = ddao.insert(dto);
		
		System.out.println(file.getOriginalFilename());
		
		// 이미지 DB 저장 및 서버 저장
		if(result > 0) {
			int seq = ddao.selectNo().get(0).getNo();
			File filePath = new File(path);

			if (!filePath.exists()) {
				filePath.mkdir();
			}
			
			String oriName = file.getOriginalFilename();
			String sysName = System.currentTimeMillis() + "_" + oriName;
			fdto.setOri_name(oriName);
			fdto.setSys_name(sysName);
			try {
				file.transferTo(new File(path + "/" + sysName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			fdto.setD_no(seq);
			ddao.insertImgs(fdto);
		}
	}
	
	public void changePwProc(String email, String pw) {
		mdao.changePwProc(email, pw);
	}
}

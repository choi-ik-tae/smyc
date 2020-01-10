package kh.spring.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.Utils.EncrypyUtil;
import kh.spring.Utils.MailUtils;
import kh.spring.Utils.TempKey;
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
	private ClosetDAO cdao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 회원가입 -> 이메일 인증까지
	@Transactional("txManager")
	public void create(MembersDTO dto) throws Exception {
		dto.setPw(EncrypyUtil.encrypt(dto.getPw()));
		
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
		
		ClosetDTO cdto = new ClosetDTO();
		cdto.setEmail(dto.getEmail());
		cdto.setName("기본옷장");
		cdto.setPub("Y");
		cdto.setMemo("");
		cdto.setImg("closet1");
		
		cdao.insert(cdto);
	
		
	}
	
	// 비밀번호 인증번호 발송	
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
	
	// 사용자 권한 주기
	@Transactional("txManager")
	public void updateAuth(String email) {
		
		mdao.updateAhthStatus(email);
	}
	
	// 닉네임 가져오기
	public int checkNickName(String nickname) {
		MembersDTO dto = mdao.checkNickName(nickname);
		int result = 0 ;
		if(dto == null) {
			result = 1;
		}
		
		return result;
	}
	
	// 로그인 체크
	public int logInOk(String email, String pw) {
		
		pw=EncrypyUtil.encrypt(pw);
		MembersDTO dto =mdao.loginOk(email, pw);
		int result = 1;
		if(dto == null) {
			result = 0;
		}
		
		return result;
	}
	
	// 권한 가져오기
	public int returnAuthStatus(String email) {
		int authstatus = mdao.returnAuthStatus(email);
		
		return authstatus;
		
	}
	
	// 닉네임 가져오기 (닉네임 중복체크)
	public String returnNickname(String email) {
		
		return mdao.returnNickname(email);
	}

	// 이메일 찾기
	public String findEmail(String name, String phone) {
		
		String email = mdao.findEmail(name, phone);
		
		return email;
	}
	

	// 비밀번호 변경
	public void changePwProc(String email, String pw) {
		pw=EncrypyUtil.encrypt(pw);
		mdao.changePwProc(email, pw);
	}
	
	// 회원 정보 가져오기
	public MembersDTO selectDTO(String email) {
		return mdao.selectDTO(email);
	}
	
	//회원 탈퇴
	public void withDraw(String email) {
		mdao.withDraw(email);
	}
	
	//회원 수정
	public void modify(MembersDTO dto) {
		dto.setPw(EncrypyUtil.encrypt(dto.getPw()));
		mdao.modify(dto);
	}
	
	public String selectGender(String email) {
		return mdao.selectGender(email);
	}
	
	
}

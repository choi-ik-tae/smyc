package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.confirm.MailUtils;
import kh.spring.confirm.TempKey;
import kh.spring.dao.MembersDAO;
import kh.spring.dto.MembersDTO;


@Service
public class MemberService {
	
	@Autowired
	private MembersDAO dao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@Transactional("txManager")
	public void create(MembersDTO dto) throws Exception {
		dao.insert(dto);
		
		
		String authkey = new TempKey().getKey(50, false);
		
		dto.setAuthkey(authkey);
		dao.updateAuthkey(dto);
		
		MailUtils sendMail = new MailUtils(mailSender);
		
		System.out.println(dto.getEmail());
		sendMail.setSubject("[ShowMeYourCloset] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>이메일 인증</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료 됩니다.</p>")
				.append("<a href='http://192.168.60.54/member/joinConfirm?email=")
				.append(dto.getEmail())
				.append("' target='_blenk'>이메일 인증 확인 </a>")
				.toString());
		sendMail.setFrom("codud966@gmail.com", "[ShowMeYourCloset]");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	
		
	}
	
	public void updateAuth(String email) {
		
		dao.updateAhthStatus(email);
	}
	
	public int checkNickName(String nickname) {
		MembersDTO dto = dao.checkNickName(nickname);
		int result = 0 ;
		if(dto == null) {
			result = 1;
		}
		
		return result;
	}

}

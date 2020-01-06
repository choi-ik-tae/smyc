package kh.spring.service;

import kh.spring.confirm.MailUtils;
import kh.spring.confirm.TempKey;
import kh.spring.dao.MembersDAO;

public class MemberService {
	
	private MembersDAO dao;
	
	public void create(MembersDTO dto) throws Exception {
		dao.insert(dto);
		
		String authkey = new TempKey().getKey(50, false);
		
		dto.setAuthor(authkey);
		dao.updateAuthkey(dto);
		
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("[Test] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>이메일 인증</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료 됩니다.</p>")
				.append("<a href='http://localhost:8080/project/joinConfirm?email='")
				.append(dto.getEmail())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인 </a>")
				.toString());
		sendMail.setFrom("codud966@gmail.com", "EmailTest");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	
		
	}

}

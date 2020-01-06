package kh.spring.service;

import org.springframework.mail.javamail.JavaMailSender;

import kh.spring.confirm.MailUtils;
import kh.spring.confirm.TempKey;
import kh.spring.dao.MembersDAO;
import kh.spring.dto.MembersDTO;

public class MemberService {
	
	private MembersDAO dao;
	
	private JavaMailSender mailSender;
	


}

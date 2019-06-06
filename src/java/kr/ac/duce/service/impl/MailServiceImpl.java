package kr.ac.duce.service.impl;

import kr.ac.duce.model.EmailModel;
import kr.ac.duce.service.MailService;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	JavaMailSender emailsender;
	
	public void sendMail(String to, String subject, String text, String from) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(to); //받는이
		message.setSubject(subject); //제목
		message.setText(text); //내용
		message.setFrom(from); //보낸이 
		try {
			emailsender.send(message);
		}catch(MailException e) {
			e.printStackTrace();
		}
	}
	
	//랜덤 비밀번호 생성
	public String getTempPassword() {
		char asc = 65;
		char[] set = new char[36]; 
		for(int i =0; i<set.length;i++) {
			if(i<10) {
				set[i]=Character.forDigit(i, 10);
			}else {
				set[i] = asc;
			}
			asc++;
		}
		int j=0;
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<8;i++) {
			j = (int)(set.length * Math.random());
			sb.append(set[j]);
		}
		return sb.toString();
	}
}
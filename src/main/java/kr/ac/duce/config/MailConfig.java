package kr.ac.duce.config;

import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	//메일을 보내기 위해 SMTP를 사용해야함
	//SMTP설정
	//반드시 Gmail - 계정 설정 - 보안 - 보안 수준이 낮은 앱의 액세스 - 허용해야 메일 전송 가능
	
	@Bean
	public static JavaMailSender getMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com"); 
		mailSender.setPort(587); //google smtp port 번호
		//메일 전송자 지정
		mailSender.setUsername("ducemaster1@gmail.com"); //어드민 계정을 새로 생성하였음
		mailSender.setPassword("ro!6@qwer4*duce"); //비밀번호
		//속성 적용
		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp"); //protocol = smtp
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true"); //starttls사용
		props.put("mail.debug", "true");

		//인증 생략해도 실행 됨
//		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
//			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
//				return new javax.mail.PasswordAuthentication("dhqoavkdldj@gmail.com", "7197562^by");
//			}
//		});

		return mailSender;
	}

}

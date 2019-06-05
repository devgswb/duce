package kr.ac.duce.service;

public interface MailService {

	public void sendMail(String to, String subject, String text, String from);
	
	public String getTempPassword();
}

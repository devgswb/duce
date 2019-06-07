package kr.ac.duce.controller;
import kr.ac.duce.model.MemberModel;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.duce.dao.MemberDao;
import kr.ac.duce.model.EmailModel;
import kr.ac.duce.model.MemberModel;
import kr.ac.duce.service.LoginService;
import kr.ac.duce.service.MailService;
import kr.ac.duce.service.impl.MailServiceImpl;

import java.lang.reflect.Member;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginAccessContorller {

	@Autowired
	MailService mailservice;

	@Autowired
	JavaMailSender jms;

	@Autowired
	LoginService ls;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@GetMapping("/login") // URL 주소
	public String loginPage(HttpServletRequest request, Model model) {
		String prevPage = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", prevPage);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        Object principal = auth.getPrincipal();
//        if (principal instanceof MemberModel) {
//            System.out.println( ((MemberModel) principal).toString());
//        } else {
//            System.out.println(principal.toString());
//        } 로그인 체크
		boolean isLoggined = !(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ANONYMOUS")));
		if (isLoggined) return "redirect:" + prevPage;
		return "member/login"; // JSP 파일명
	}
	//비밀번호 찾기 페이지
	@GetMapping("/passwordfind")
	public String findView() {
		return "/member/password-find";
	}
	//아이디 찾기
	@GetMapping("/findid")
	public String findIdView() {
		return "/member/id-find";
	}
	//비밀번호 찾기 폼 실행
	@PostMapping(value = "findpass", params = { "id", "mail" })
	public ModelAndView sendMail(MemberModel um, EmailModel mailmodel, @RequestParam Map<String, Object> params)
			throws Exception {
		ModelAndView mav;
		// 파라미터 값 넘겨받음
		String id = (String) params.get("id");
		String mail = (String) params.get("mail");
		String pw = mailservice.getTempPassword();

		// 아이디 검색
		um = ls.loadUserByUsername(id);

		String from = "ducemaster1@gmail.com";
		// 아이디와 비밀번호가 일치한다면 임시 비밀번호 메일 발송
		if (id.equals(um.getId()) && mail.equals(um.getMail())) {
			um.setPassword(pwEncoder.encode(pw));
			ls.passowrdInsert(um);
			mailmodel.setContent(id + "님의 \n임시 비밀번호는 " + pw + " 입니다."); // 본문
			mailmodel.setReceiver(mail); // 받을 메일 주소
			mailmodel.setSubject("캡스톤 전시관 임시 비밀번호"); // 제목
			mailservice.sendMail(mail, mailmodel.getSubject(), mailmodel.getContent(), from);
			mav = new ModelAndView("member/login");
		} else if (!id.equals(um.getId())) {
			new BadCredentialsException(id);
			mav = new ModelAndView("redirect:/passwordfind");
		} else if (!mail.equals(um.getMail())) {
			new BadCredentialsException(mail);
			mav = new ModelAndView("redirect:/passwordfind");
		} else {
			mav = new ModelAndView("redirect:/passwordfind");
		}
		return mav;
	}
	//아이디찾기 폼 실행
	@PostMapping(value = "idsearch", params = { "name", "hp" })
	public String findId(EmailModel mailmodel, MemberModel um ,HttpSession session, @RequestParam Map<String, Object> params) throws Exception {
		String name = (String) params.get("name");
		String hp = (String) params.get("hp");
		boolean isMatch = true;
		boolean second = true;
		session.setAttribute("second", second);
		um = ls.findId(name, hp);
//		session.setAttribute("id", uid);
		try{
			session.setAttribute("isMatch", isMatch);
			String from = "ducemaster1@gmail.com";
			String uid = um.getId();
			String mail = um.getMail();
			mailmodel.setContent(name + "님의 아이디는 " + uid + " 입니다."); // 본문
			mailmodel.setReceiver(mail); // 받을 메일 주소
			mailmodel.setSubject("캡스톤 전시관 아이디 찾기"); // 제목
			mailservice.sendMail(mail, mailmodel.getSubject(), mailmodel.getContent(), from);
		}catch(Exception e){
			isMatch = false;
			session.setAttribute("isMatch", isMatch);
			return "redirect:/findid";
		}
		
		
		
		return "redirect:/findid";
	}
}

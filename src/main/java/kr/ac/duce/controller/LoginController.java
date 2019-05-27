package kr.ac.duce.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.UserModel;
import kr.ac.duce.service.impl.CustomAuthenticationProvider;
import kr.ac.duce.service.impl.CustomUserDetailsService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	CustomAuthenticationProvider customAuthenticationProvider;
	@Autowired
	BCryptPasswordEncoder PwEncode;
	@Autowired
	CustomUserDetailsService loginservice;

	@Autowired
	UserDao userDao;

	//로그인
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST })
	public String viewLoginForm(HttpServletRequest request, HttpSession session) {

		String ref = request.getHeader("referer");
		session.setAttribute("prevPage", ref);
		
		return "/member/login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
//		session.removeAttribute("name");
//		session.removeAttribute("author");
		//세션 초기화
		session.invalidate();
		return "redirect:/";
	}

	
	//회원가입
	@PostMapping(value ="/register.do", params= {"id","password", "name","mail","hp"})
	public String viewRegiForm(UserModel userModel, HttpServletRequest request,
			@RequestParam String id, @RequestParam String password, @RequestParam String name, @RequestParam String mail, @RequestParam String hp) {
	
		UserModel searchUser = userDao.findByid(id);
		//아이디가 없다면 회원가입 진행
		if(searchUser == null) {
			userModel.setUsername(id);
			userModel.setPassword(PwEncode.encode(password));
			userModel.setName(name);
			userModel.setMail(mail);
			userModel.setHp(hp);
			
			loginservice.register(userModel);
			
		}else {
			return "regiError";
		}
		
			return "redirect:/";
	}
	
//	get으로 register페이지 요청시
	@RequestMapping(value= "/register", method = RequestMethod.GET)
	public String registerForm(UserModel usermodel) {
		return "/member/register";
	}

	@RequestMapping("/loginError")
	public String loginFail(UserModel usermodel) {
		StringBuffer buf = new StringBuffer();

		
		buf.append(usermodel.getUsername());
		buf.append(", ");
		buf.append(usermodel.getPassword());
		buf.append(", ");
		buf.append("실패");
		
		return buf.toString();
	}
	
}

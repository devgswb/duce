package kr.ac.duce.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.lang.management.MonitorInfo;
//import com.mysql.cj.protocol.Resultset;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.UserManageModel;
import kr.ac.duce.model.UserModel;
import kr.ac.duce.service.AdminService;
import kr.ac.duce.service.impl.CustomAuthenticationProvider;
import kr.ac.duce.service.impl.CustomUserDetailsService;

@Controller
public class LoginController {

	@Autowired
	CustomAuthenticationProvider customAuthenticationProvider;
	@Autowired
	BCryptPasswordEncoder PwEncode;
	@Autowired
	CustomUserDetailsService loginservice;

	@Autowired
	UserDao userDao;
	/*
	완수하지 못한 것들
	1.관리자 페이지 - 권한 수정. 페이지에 리스트추가는 되었으나 수정기능을 완성하지 못하였음
	2.로그인 실패 페이지. 
	3.accessDeniedHanlder. -> 권한없는 사용자가  write 등 권한이 필요한 페이지 요청시 거절하는 이벤트 핸들러
	 -핸들러를 생성하지 않고 jsp 페이지 내부 form에 sec:authorize 구문을 추가하여
	     해당 권한을 가지고 있지않으면 해당 form을 안보이게 한 c:choose 기능을 이용, 다른 폼을 보이게 하는 방법도 존재
	4.아이디 찾기 미구현
	5.비밀번호 찾기 미구현
	6.회원가입 - 아이디 중복확인 미구현
	*/
	
	// 로그인
	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String loginForm(HttpServletRequest request, HttpSession session) {
		// 참고 id = admin , pasword = 1q2w3e

		// 로그인시 이전 페이지로 리디렉트하기 위해 페이지 정보 넘김
		String ref = request.getHeader("referer");
		session.setAttribute("prevPage", ref);

		return "/member/login";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 초기화
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 폼 실행
	@PostMapping(value = "/register.do", params = { "id", "password", "name", "mail", "hp" })
							//valid를 사용하면 값이 null인 것이 있으면 오류
	public String viewRegiForm(@Valid UserModel userModel, HttpServletRequest request, @RequestParam String id,
			@RequestParam String password, @RequestParam String name, @RequestParam String mail,
			@RequestParam String hp) {

		UserModel searchUser = userDao.findByid(id);
		// 아이디가 없다면 회원가입 진행
		if (searchUser == null) {
			// Security에서 제공하는 User인터페이스의 setId == setUsername
			userModel.setUsername(id);
			userModel.setPassword(PwEncode.encode(password));
			userModel.setName(name);
			userModel.setMail(mail);
			userModel.setHp(hp);

			loginservice.register(userModel);

		} else {
			return "regiError";
		}

		return "redirect:/";
	}

//	register페이지 요청
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(UserModel usermodel) {
		return "/member/register";
	}

	// 로그인 에러
	@RequestMapping("/loginError")
	public String loginFail(UserModel usermodel) {
		StringBuffer buf = new StringBuffer();
		// 아이디 검색 => 존재하면 비번 틀림.
		// 아이디 없음 => 존재하지 않는 아이디입니다 추가

		buf.append(usermodel.getUsername());
		buf.append(", ");
		buf.append(usermodel.getPassword());
		buf.append(", ");
		buf.append("실패");

		return buf.toString();
	}

	// 개인정보 수정 페이지
	@GetMapping(value = "/userUpdate")
	public String userUpdateForm(UserModel um) {

		return "/member/userUpdate";
	}

	@PostMapping(value = "/userUpdate.do", params = { "password", "name", "mail", "hp" })
	public String userUpdate(HttpSession session, UserModel userModel, HttpServletRequest request,
			@RequestParam String password, @RequestParam String name, @RequestParam String mail,
			@RequestParam String hp) {
		
		
		userModel.setPassword(PwEncode.encode(password));
		userModel.setName(name);
		userModel.setMail(mail);
		userModel.setHp(hp);
		
		
		logout(session);
		return "redirect:/";
	}
}

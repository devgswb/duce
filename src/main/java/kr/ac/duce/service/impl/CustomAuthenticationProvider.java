package kr.ac.duce.service.impl;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.UserModel;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider  {

	@Autowired
	HttpSession session;
	@Autowired
	private UserDetailsService userDetailsService;
	@Autowired
	UserDao userDao;

	UserModel usermodel;
	CustomUserDetailsService cs ;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//로그인 요청 아이디, 비밀번호 
		String id = authentication.getPrincipal().toString();
		String password = authentication.getCredentials().toString();
		//DB 정보
		UserModel user = (UserModel)userDetailsService.loadUserByUsername(id);
		
		if(user.getUsername()==null) {
			throw new UsernameNotFoundException(id);
		}else if(!pwEncoder.matches(password, user.getPassword())) {
			throw new BadCredentialsException(password);
		}else {
			//세션에 정보 넘김
			session.setAttribute("id", id);
			session.setAttribute("pw", password);
			session.setAttribute("name", user.getName());
			session.setAttribute("mail", user.getMail());
			session.setAttribute("hp", user.getHp());
			//회원정보 수정을 위함
			session.setAttribute("auth", user.getAuthority());
			
			//권한 설정을 위함
			session.setAttribute("author", user.getAuthorities());
		}
		//계정이 활성화되어있지 않다면 에러
		if(!user.isEnabled()) {
			throw new BadCredentialsException(id);
		}
		
		//아이디, 비밀번호, 권한 넘김
		return new UsernamePasswordAuthenticationToken(id, password, user.getAuthorities());
	}
	
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	
}

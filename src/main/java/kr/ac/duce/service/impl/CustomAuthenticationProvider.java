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
			//로그인을 위해 세션값에 이름을 넘긴다
			session.setAttribute("name", user.getName());
			session.setAttribute("author", user.getAuthorities());
		}
		
		if(!user.isEnabled()) {
			throw new BadCredentialsException(id);
		}
		
		
		return new UsernamePasswordAuthenticationToken(id, password, user.getAuthorities());
	}
	
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	
}

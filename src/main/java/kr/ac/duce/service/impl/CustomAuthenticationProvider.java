package kr.ac.duce.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.UserModel;

public class CustomAuthenticationProvider implements AuthenticationProvider  {

	@Autowired
	UserDao userDao;
	@Autowired
	UserModel userModel;
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id = authentication.getName();
		String password = authentication.getCredentials().toString();
		
		UserModel searchUser = userDao.findByid(id);
		if(searchUser.toString() == null) {
			userDao.register(userModel);
			
		}
		
		return new UsernamePasswordAuthenticationToken(id, password, new ArrayList<>());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}

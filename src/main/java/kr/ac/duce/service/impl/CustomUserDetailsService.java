package kr.ac.duce.service.impl;

import java.util.ArrayList;
import java.util.Collection;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.UserModel;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	UserDao userDao;

	// SimpleGrantedAuthority 객체 생성시 ROLE_ 을 붙여야 Spring이 이해 가능
	private static final String ROLE_PREFIX = "ROLE_";
	public Collection<GrantedAuthority> getAuthority(String id){
		String s_auth = userDao.readAuthority(id);
		Collection<GrantedAuthority> authoritis = new ArrayList<GrantedAuthority>();
		authoritis.add(new SimpleGrantedAuthority(ROLE_PREFIX + s_auth));
		return authoritis;
	}
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

		UserModel userModel = userDao.findByid(id);
		
		if (userModel == null) {
			throw new UsernameNotFoundException(id);
		}else {
			userModel.setAuthorities(getAuthority(id));
		}
		
		return userModel;
	}
	
	// 회원가입 
	public void register(UserModel userModel) {
		userModel.setAccountNonExpired(true);
		userModel.setAccountNonLocked(true);
		userModel.setCredentialsNonExpired(true);
		userModel.setEnabled(true);
		userDao.register(userModel);
	}

}

package kr.ac.duce.service.impl;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.SecurityUserModel;
import kr.ac.duce.model.UserModel;
import kr.ac.duce.model.UserRepository;


@Service
public class LoginServiceImpl implements UserDetailsService {

	@Autowired
	UserRepository userRepo;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired 
	UserDao userDao;

	//SimpleGrantedAuthority 객체 생성시 ROLE_ 을 붙여야 Spring이 이해 가능
	private static final String ROLE_PREFIX = "ROLE_";
	
	
	//DB에서 권한 정보를 받아와 해당하는 권한을 부여
	private static List<GrantedAuthority> makeGrantedAuthority(List<String> roles){
		List<GrantedAuthority> list = new ArrayList<>();
		roles.forEach(role -> list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role)));
		return list;
	}
	
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
			
		UserModel userModel = userDao.findByid(id);
		//id != null이면 권한 부여
		if(userModel != null) {
			userModel.setAuthorities(makeGrantedAuthority(userRepo.findauthoritiesbyid(id)));
		}
		
		return new SecurityUserModel(userModel);
		
	}
	//회원가입
	public UserModel register(UserModel usermodel, String role) {
		usermodel.setName(usermodel.getName());
		usermodel.setHp(usermodel.getHp());
		usermodel.setMail(usermodel.getMail());
		usermodel.setPassword(passwordEncoder.encode(usermodel.getPassword()));
		usermodel.setAccountNonExpired(true);
		usermodel.setAccountNonLocked(true);
		usermodel.setCredentialsNonExpired(true);
		usermodel.setEnabled(true);
		return userRepo.register(usermodel, role);
	}

}

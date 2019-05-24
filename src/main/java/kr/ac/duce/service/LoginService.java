package kr.ac.duce.service;

import java.util.List;

import kr.ac.duce.model.UserModel;

public interface LoginService {
	//권한 가져오기
	public List<String> readAuthority(String id);
	//아이디로 찾기
	
	public UserModel findByUserid(String id);

	//회원가입
	public UserModel register(UserModel usermodel) throws Exception;

	
}
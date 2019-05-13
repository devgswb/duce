package kr.ac.duce.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class SecurityUserModel extends User {

	private static final long serialVersionUID = 1L;

	//ip정보를 추가로 가져오는 용도
	private String ip;
	
	public SecurityUserModel(UserModel userModel) {
		super(userModel.getUsername(), userModel.getPassword(), userModel.getAuthorities());

	}

	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}

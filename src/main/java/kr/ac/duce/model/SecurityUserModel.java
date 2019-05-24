package kr.ac.duce.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class SecurityUserModel extends User {

	private static final long serialVersionUID = 1L;

	public SecurityUserModel(UserModel userModel) {
		super(userModel.getUsername(), userModel.getPassword(), userModel.getAuthorities());
	}
}

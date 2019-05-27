package kr.ac.duce.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



public class UserModel implements UserDetails{
	
	
	
	private static final long serialVersionUID = 1L;
	
	private String authority;
	private String id;
	private String name;
	private String password;
	private String mail;
	private String hp;
	
	private boolean isAccountNonExpired; 
	private boolean isAccountNonLocked;
	@SuppressWarnings("unused")
	private boolean isCredentialsNonExpired; 
	private boolean isEnabled;
	private Collection <? extends GrantedAuthority> authorities;
	/*스프링 시큐리티는 사용자 정보를 UserDetails 구현체로 사용.
	 그래서 스프링 시큐리티는 org.springframework.security.core.userdetails.User라는 클래스를 제공
	 그러나 이름과 패스워드 그리고 권한들에 대한 필드만 존재하기 때문에 
	 이메일 정보 또는 프로필 이미지 경로 등과 같은 부가적인 정보를 담을 수 없음 => UserDetails를 커스텀해야함
	 이 경우 UserModel = UserDetails*/
//	public UserModel(String username, String password, boolean enabled, boolean accountNonExpired,
//			boolean credentialsNonExpired, boolean accountNonLocked,
//			Collection<? extends GrantedAuthority> authorities) {
//		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
//		
//	}
	//하지만 그냥 상속받아 사용
	
	
//	public String getAuthority() {
//		return authority;
//	}
//	public void setAuthority(String authority) {
//		this.authority = authority;
//	}

	
	@Override
	public String getUsername() {
		return this.id;
	}
	
	public void setUsername(String id) {
		this.id = id;
	}
	
	
	@Override
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}
	
	
	
	@Override
	public boolean isAccountNonExpired() {
		return this.isAccountNonExpired;
	}
	@Override
	public boolean isAccountNonLocked() {
		return this.isAccountNonLocked;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return this.isAccountNonExpired;
	}
	@Override
	public boolean isEnabled() {
		return this.isEnabled;
	}
	

	
	
	public void setAccountNonExpired(boolean isAccountNonExpired) {
		this.isAccountNonExpired = isAccountNonExpired;
	}
	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked = isAccountNonLocked;
	}
	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
		this.isCredentialsNonExpired = isCredentialsNonExpired;
	}
	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	
	
	
	
	
}
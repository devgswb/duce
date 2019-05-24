package kr.ac.duce.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;


import kr.ac.duce.model.UserModel;

public interface UserDao {
	
	//로그인 시 아이디 찾기
	@Select("Select * from duce.userinfo where id = #{id}")
	public UserModel findByid(String id);
	
	//회원가입
	@Insert("Insert into duce.userinfo(id, password, name, mail, hp, isAccountNonExpired, isAccountNonLocked, isCredentialsNonExpired, isEnabled)"
			+ " values(#{id}, #{password}, #{name}, #{mail}, #{hp}, "
			+ "#{isAccountNonExpired}, #{isAccountNonLocked}, #{isCredentialsNonExpired}, #{isEnabled})")
	public void register(UserModel usermodel);
	//#{isAccountNonExpired}, #{isAccountNonLocked}, #{isCredentialsNonExpired}, #{isEnabled}
	//관리자 - 모든 유저 검색
//	@Select("Select * from duce.userinfo")
//	public List readAllUsers();

	//권한 가져오기
	@Select("Select authority From duce.userinfo where id = #{id}")
	public String readAuthority(String id);
//	public UserModel readAuthority(String id);
	
	@Select("Select name From duce.userinfo where id = #{id}")
	public String readName(String id);
	
//	@Insert("Insert into duce.userinfo(authority) values(#{authority})")
//	public void insertAuthority(String authority);
}
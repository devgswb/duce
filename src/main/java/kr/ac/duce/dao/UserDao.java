package kr.ac.duce.dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;


import kr.ac.duce.model.UserManageModel;
import kr.ac.duce.model.UserModel;
import kr.ac.duce.page.SearchCriteria;

public interface UserDao {
	//아이디로 정보 검색
	@Select("Select * from duce.userinfo where id = #{id}")
	public UserModel findByid(String id);
	
	//회원가입
	@Insert("Insert into userinfo(id, password, name, mail, hp, isAccountNonExpired, isAccountNonLocked, isCredentialsNonExpired, isEnabled)"
			+ " values(#{id}, #{password}, #{name}, #{mail}, #{hp}, "
			+ "#{isAccountNonExpired}, #{isAccountNonLocked}, #{isCredentialsNonExpired}, #{isEnabled})")
	public void register(UserModel usermodel);

	//회원정보 수정
	@Update("update userinfo set password=#{password}, name=#{name}, mail=#{mail}, hp=#{hp} where id = #{id}")
	public void userUpdate(UserModel usermodel);
	
	//권한 가져오기
	@Select("Select authority From userinfo where id = #{id}")
	public String readAuthority(String id);

	//-----------   관리자   -----------------------
	// 모든 유저 검색
	@Select("Select id, name, mail, hp, authority, isEnabled from userinfo")
	public List<Map<String,Object>> readAllUsers(SearchCriteria cri);
	
	//권한 설정
	@Update("update userinfo set authority = #{authority} where id = #{id}")
	public void updateAuthor(UserManageModel um);
	
	//잠금 설정
	@Update("update userinfo set isEnabled = #{isEnabled} where id= #{id}")
	public void updateEnabled(UserManageModel usermodel);

}
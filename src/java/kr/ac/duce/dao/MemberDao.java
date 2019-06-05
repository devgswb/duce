package kr.ac.duce.dao;

import kr.ac.duce.model.MemberModel;

import java.lang.reflect.Member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDao {
// MemberSignService와 LoginService에 사용되는 DAO

    @Select("SELECT * FROM userinfo WHERE id = #{id}")
    public MemberModel getUserById(@Param("id") String id);

    @Insert("Insert into userinfo(id, password, name, mail, hp, isAccountNonExpired, isAccountNonLocked, " +
            "isCredentialsNonExpired, isEnabled, authority) values(#{id}, #{password}, #{name}, #{mail}, #{hp}, " +
            "#{isAccountNonExpired}, #{isAccountNonLocked}, #{isCredentialsNonExpired}, #{isEnabled}, #{authority})")
    public void registerUser(MemberModel user);

    //비밀번호 수정
    @Update("Update userinfo set password=#{password} where id = #{id}")
    public void passowrdInsert(MemberModel membermodel);
    
    //아이디 찾기.
    @Select("Select * from userinfo where name = #{name} and hp = #{hp}")
    public MemberModel findId(@Param("name") String name, @Param("hp") String hp);
}

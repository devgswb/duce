package kr.ac.duce.dao;

import kr.ac.duce.model.MemberModel;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Collection;

public interface MemberDao {
// MemberSignService와 LoginService에 사용되는 DAO

    @Select("SELECT * FROM userinfo WHERE id = #{id}")
    public MemberModel getUserById(@Param("id") String id);

    @Select("select id, name, authority, mail, hp, isEnabled from userinfo order by id")
    public Collection<MemberModel> getUserForAdmin();

    @Insert("Insert into userinfo(id, password, name, mail, hp, isAccountNonExpired, isAccountNonLocked, " +
            "isCredentialsNonExpired, isEnabled, authority) values(#{id}, #{password}, #{name}, #{mail}, #{hp}, " +
            "#{isAccountNonExpired}, #{isAccountNonLocked}, #{isCredentialsNonExpired}, #{isEnabled}, #{authority})")
    public void registerUser(MemberModel user);
}

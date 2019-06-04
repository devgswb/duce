package kr.ac.duce.dao;

import kr.ac.duce.model.MemberModel;
import kr.ac.duce.model.ProjectBoardModel;

import java.util.List;

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
    
    @Update("Update userinfo set mail=#{mail}, hp=#{hp} where id=#{id}")
    public void updateUser(MemberModel user); 
    
    @Update("Update userinfo set password=#{password} where id=#{id}")
    public void updatePw(MemberModel user); 
    
    @Update("Update userinfo set isEnabled = false where id=#{id}")
    public void deleteUser(MemberModel user); 
    
    @Select("Select * from projectboard where id = #{id}")
    public List<ProjectBoardModel> findproject(@Param("id") String id);
}

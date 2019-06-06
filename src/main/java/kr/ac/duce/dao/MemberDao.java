package kr.ac.duce.dao;

import kr.ac.duce.model.MemberModel;
import java.lang.reflect.Member;
import kr.ac.duce.model.ProjectBoardModel;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.Collection;

public interface MemberDao {
// MemberSignService와 LoginService에 사용되는 DAO

    @Select("SELECT * FROM userinfo WHERE id = #{id}")
    public MemberModel getUserById(@Param("id") String id);
/*
    관리자 페이지 기능
 */
    @Select("select id, name, authority, mail, hp, isEnabled from userinfo order by field(authority, 'admin') DESC , id asc LIMIT #{pageNum}, #{showingCount}")
    public Collection<MemberModel> getUserForAdmin(int pageNum, int showingCount);

    @Select("select count(id) from userinfo")
    public int getAllMemberCount();

    @Update("UPDATE userinfo SET authority=#{authority}, isEnabled=#{isEnabled} where id=#{id}")
    void updateMemberByAdmin(MemberModel member);

    @Select("select id, name, authority, mail, hp, isEnabled from userinfo where ${param} LIKE CONCAT('%',#{searchWord},'%') order by field(authority, 'admin') DESC")
    Collection<MemberModel> getMemberBySearch(String param, String searchWord);
/*
    관리자 비밀번호 변경
 */
    @Update("UPDATE userinfo SET password=#{pwd} where id=#{id}")
    void setAdminPassword(String id, String pwd);
/*
    회원 등록
 */
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

    @Update("Update userinfo set mail=#{mail}, hp=#{hp} where id=#{id}")
    public void updateUser(MemberModel user);

    @Update("Update userinfo set password=#{password} where id=#{id}")
    public void updatePw(MemberModel user);

    @Update("Update userinfo set isEnabled = false where id=#{id}")
    public void deleteUser(MemberModel user);

    @Select("Select * from projectboard where id = #{id}")
    public List<ProjectBoardModel> findproject(@Param("id") String id);
}

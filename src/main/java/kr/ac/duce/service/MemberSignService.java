package kr.ac.duce.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.duce.model.MemberModel;
import kr.ac.duce.model.ProjectBoardModel;

public interface MemberSignService {
	public MemberModel getUserById(String id);
    public void memberRegister(MemberModel user);
    public void updateUser(MemberModel user);
    public void updatePw(MemberModel user);
    public List<ProjectBoardModel> findproject(String id);
    public void deleteUser(MemberModel user);
}

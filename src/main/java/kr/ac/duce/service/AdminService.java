package kr.ac.duce.service;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import kr.ac.duce.model.UserManageModel;
import kr.ac.duce.page.SearchCriteria;


public interface AdminService {
	//유저목록을 유저 관리 페이지에 출력 위함
	public List<Map<String,Object>> readAllUsers(SearchCriteria cri) throws Exception;
	//관리 페이지에서 유저 권한 업데이트
	public void updateAuthor(UserManageModel um);
	//권한 설정 
	public void updateEnabled(UserManageModel usermodel);
}
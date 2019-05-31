package kr.ac.duce.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.UserManageModel;
import kr.ac.duce.page.SearchCriteria;
import kr.ac.duce.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	UserDao userdao;
	
	
	@Override
	public List<Map<String,Object>> readAllUsers(SearchCriteria cri) throws Exception {
		return userdao.readAllUsers(cri);
	}


	@Override
	public void updateAuthor(UserManageModel um) {
		userdao.updateAuthor(um);
	}


	@Override
	public void updateEnabled(UserManageModel usermodel) {
		userdao.updateEnabled(usermodel);
	}

}

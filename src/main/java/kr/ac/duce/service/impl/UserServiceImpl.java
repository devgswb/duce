package kr.ac.duce.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.UserModel;
import kr.ac.duce.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userdao;
	
	@Override
	public void userUpdate(UserModel usermodel) {
		userdao.userUpdate(usermodel);
	}

}

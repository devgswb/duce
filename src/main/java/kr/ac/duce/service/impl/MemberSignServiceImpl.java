package kr.ac.duce.service.impl;

import kr.ac.duce.dao.MemberDao;
import kr.ac.duce.model.MemberModel;
import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.service.LoginService;
import kr.ac.duce.service.MemberSignService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberSignServiceImpl implements MemberSignService {

    @Autowired
    private MemberDao dao;

    @Autowired
    private PasswordEncoder pwEncoder;

	@Override
	public MemberModel getUserById(String id) {
		return dao.getUserById(id);
	}
    
    @Override
    public void memberRegister(MemberModel user) {
        user.setPassword(pwEncoder.encode(user.getPassword()));
        user.setAuthority("none_auth");
        dao.registerUser(user);
    }
    
	@Override
	public void updateUser(MemberModel user) {
		dao.updateUser(user);		
	}

	@Override
	public void updatePw(MemberModel user) {
		user.setPassword(pwEncoder.encode(user.getPassword()));
		dao.updatePw(user);
	}

	@Override
	public List<ProjectBoardModel> findproject(String id) {
		return dao.findproject(id);
	}

	@Override
	public void deleteUser(MemberModel user) {
		dao.deleteUser(user);		
	}

}

package kr.ac.duce.service.impl;

import kr.ac.duce.dao.MemberDao;
import kr.ac.duce.model.MemberModel;
import kr.ac.duce.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private MemberDao dao;

    @Override
    public MemberModel loadUserByUsername(String id) throws UsernameNotFoundException {
        MemberModel user = dao.getUserById(id);
        if (user == null ) { throw new UsernameNotFoundException(id); }
        return user;
    }
}

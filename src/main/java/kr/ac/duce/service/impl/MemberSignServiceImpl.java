package kr.ac.duce.service.impl;

import kr.ac.duce.dao.MemberDao;
import kr.ac.duce.model.MemberModel;
import kr.ac.duce.service.LoginService;
import kr.ac.duce.service.MemberSignService;
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
    public void memberRegister(MemberModel user) {
        user.setPassword(pwEncoder.encode(user.getPassword()));
        user.setAuthority("none_auth");
        dao.registerUser(user);
    }
}

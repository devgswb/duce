package kr.ac.duce.service.impl;

import kr.ac.duce.dao.MemberDao;
import kr.ac.duce.service.AdminPasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AdminPasswordServiceImpl implements AdminPasswordService {
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MemberDao dao;

    @Override
    public void changePassword(String id, String changedpwd) {
        dao.setAdminPassword(id, passwordEncoder.encode(changedpwd));
    }
}

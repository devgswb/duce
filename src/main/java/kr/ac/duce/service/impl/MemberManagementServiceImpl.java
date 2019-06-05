package kr.ac.duce.service.impl;

import kr.ac.duce.dao.MemberDao;
import kr.ac.duce.model.MemberModel;
import kr.ac.duce.service.MemberManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class MemberManagementServiceImpl implements MemberManagementService {

    @Autowired
    private MemberDao dao;

    @Override
    public Collection<MemberModel> getMembers() {
        return dao.getUserForAdmin();
    }
}

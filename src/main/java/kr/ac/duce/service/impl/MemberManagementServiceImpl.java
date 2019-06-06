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
    public Collection<MemberModel> getMembers(int page, int count) {
        page = (page - 1) * count;
        return dao.getUserForAdmin(page, count);
    }

    @Override
    public int getAllMemberCount() {
        return dao.getAllMemberCount();
    }

    @Override
    public void updateMemberByAdmin(Collection<MemberModel> MemberList) {
        for (MemberModel member: MemberList) {
            dao.updateMemberByAdmin(member);
        }
    }

    @Override
    public Collection<MemberModel> getMemberBySearch(String param, String searchWord) {
        return dao.getMemberBySearch(param, searchWord);
    }
}

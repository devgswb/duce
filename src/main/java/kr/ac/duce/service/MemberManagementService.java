package kr.ac.duce.service;

import kr.ac.duce.model.MemberModel;

import java.util.Collection;

public interface MemberManagementService {
    Collection<MemberModel> getMembers(int page, int count);
    int getAllMemberCount();

    void updateMemberByAdmin(Collection<MemberModel> MemberList);

    Collection<MemberModel> getMemberBySearch(String param, String searchWord);
}

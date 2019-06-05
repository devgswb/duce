package kr.ac.duce.service;

import kr.ac.duce.model.MemberModel;

import java.util.Collection;

public interface MemberManagementService {

    Collection<MemberModel> getMembers();
}

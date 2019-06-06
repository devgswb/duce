package kr.ac.duce.service;

import kr.ac.duce.model.MemberModel;

import java.util.Collection;

public interface AdminPasswordService {

    void changePassword(String id, String changedpwd);
}

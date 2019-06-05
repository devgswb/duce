package kr.ac.duce.service;

import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.MemberModel;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

public interface MajorBranchSettingService {

    List<BranchCodeModel> getBranch();
    List<MajorCodeModel> getMajor();

    void addMajor(String majorNo, String major);

    void addBranch(String branchNo, String branch);

    void deleteMajor(Collection<String> parsedMajorList);

    void deleteBranch(Collection<String> parsedBranchList);

    void updateMajor(Collection<MajorCodeModel> parsedMajorList);

    void updateBranch(Collection<BranchCodeModel> parsedBranchList);

    List<MemberModel> getMembers();
}

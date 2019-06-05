package kr.ac.duce.service.impl;

import kr.ac.duce.dao.BranchCodeDao;
import kr.ac.duce.dao.MajorCodeDao;
import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.service.MajorBranchSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service
public class MajorBranchSettingServiceImpl implements MajorBranchSettingService {
    @Autowired
    private MajorCodeDao majorDAO;

    @Autowired
    private  BranchCodeDao branchDAO;

    @Override
    public List<BranchCodeModel> getBranch() {
        return branchDAO.getBranchList();
    }
    @Override
    public List<MajorCodeModel> getMajor() {
        return majorDAO.getMajorList();
    }

    @Override
    public void addMajor(String majorNo, String major) {
        MajorCodeModel inputModel = new MajorCodeModel();
        inputModel.setMajorNo(majorNo);
        inputModel.setMajor(major);
        majorDAO.addMajorCode(inputModel);
    }

    @Override
    public void addBranch(String branchNo, String branch) {
        BranchCodeModel inputModel = new BranchCodeModel();
        inputModel.setBranchNo(branchNo);
        inputModel.setBranch(branch);
        branchDAO.addBranchCode(inputModel);
    }

    @Override
    public void deleteMajor(Collection<String> parsedMajorList) {
        for (String majorNo : parsedMajorList) {
            majorDAO.deleteByNo(majorNo);
        }
    }

    @Override
    public void deleteBranch(Collection<String> parsedBranchList) {
        for (String branchNo : parsedBranchList) {
            branchDAO.deleteByNo(branchNo);
        }
    }

    @Override
    public void updateMajor(Collection<MajorCodeModel> MajorList) {
        for (MajorCodeModel major: MajorList) {
            majorDAO.updateMajor(major);
        }
    }

    @Override
    public void updateBranch(Collection<BranchCodeModel> BranchList) {
        for (BranchCodeModel branch: BranchList) {
            branchDAO.updateBranch(branch);
        }
    }
}

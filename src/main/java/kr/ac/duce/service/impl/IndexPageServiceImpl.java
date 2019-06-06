package kr.ac.duce.service.impl;

import kr.ac.duce.dao.BranchCodeDao;
import kr.ac.duce.dao.MajorCodeDao;
import kr.ac.duce.dao.ProjectBoardDao;
import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.model.ProjectBoardViewModel;
import kr.ac.duce.module.BoardViewMaker;
import kr.ac.duce.service.IndexPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexPageServiceImpl implements IndexPageService {
    @Autowired
    ProjectBoardDao dao;

    @Autowired
    MajorCodeDao majorDao;

    @Autowired
    BranchCodeDao branchDao;

    @Override
    public List<ProjectBoardViewModel> getSampleProject(int number) {
        List<ProjectBoardModel> returnList = dao.getSampleProjects(number);
        List<MajorCodeModel> majorList = majorDao.getMajorList();
        List<BranchCodeModel> branchList = branchDao.getBranchList();
        return BoardViewMaker.makeList(returnList, majorList, branchList);
    }
}

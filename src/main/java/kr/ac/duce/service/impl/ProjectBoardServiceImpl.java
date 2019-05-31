
package kr.ac.duce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.ProjectBoardDao;
import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.service.ProjectBoardService;

@Service
public class ProjectBoardServiceImpl implements ProjectBoardService {

	@Autowired
	private ProjectBoardDao ProjectBoardDao;

	@Override
	public List<ProjectBoardModel> findByNo(int pNo) {
		return ProjectBoardDao.findbyNo(pNo);
	}

	@Override
	public void insert(ProjectBoardModel projectboard) {
		ProjectBoardDao.insert(projectboard);
	}

	@Override
	public void update(ProjectBoardModel projectboard) { 
		ProjectBoardDao.update(projectboard);
	}

	@Override
	public void delete(int pNo) {
		ProjectBoardDao.delete(pNo);
	}

	@Override
	public List<ProjectBoardModel> findAll() {
		return ProjectBoardDao.findAll();
	}

	@Override
	public List<ProjectBoardModel> findPage(int page) {
		int min = (page - 1) * 10;
		int max = page * 10;
		List<ProjectBoardModel> resList = ProjectBoardDao.findPage(min, max);
		return resList;
	}

	@Override
	public int getTopbNo() {
		ProjectBoardModel res = ProjectBoardDao.findPage(0, 1).get(0);
		return res.getpNo();
	}


	@Override
	public List<ProjectBoardModel> findbyfilter(String major, String branch) {
		return ProjectBoardDao.findbyfilter(major, branch);
	}
	
	@Override
	public List<ProjectBoardModel> findbyfilterM(String major) {
		return ProjectBoardDao.findbyfilterM(major);
	}

	@Override
	public List<ProjectBoardModel> findbyfilterB(String branch) {
		return ProjectBoardDao.findbyfilterB(branch);
	}

	@Override
	public List<ProjectBoardModel> branchfind() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectBoardModel> majorfind() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MajorCodeModel> majorCode() {
		return ProjectBoardDao.majorCode();
	}

	@Override
	public List<BranchCodeModel> branchCode() {
		return ProjectBoardDao.branchCode();
	}

	@Override
	public List<ProjectBoardModel> findbyfilterY(String mYear) {
		return ProjectBoardDao.findbyfilterY(mYear);
	}

	@Override
	public List<ProjectBoardModel> findbyfilterYB(String mYear, String branch) {
		return ProjectBoardDao.findbyfilterYB(mYear, branch);
	}

	@Override
	public List<ProjectBoardModel> findbyfilterYM(String mYear, String major) {
		return ProjectBoardDao.findbyfilterYM(mYear, major);
	}

	@Override
	public List<ProjectBoardModel> findbyfilterYMB(String mYear, String major, String branch) {
		return ProjectBoardDao.findbyfilterYMB(mYear, major, branch);
	}


}

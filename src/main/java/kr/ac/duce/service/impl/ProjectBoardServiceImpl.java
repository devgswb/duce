
package kr.ac.duce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.ProjectBoardDao;
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
	public List<ProjectBoardModel> branchfind() {
		return ProjectBoardDao.branchfind();
	}

	@Override
	public List<ProjectBoardModel> majorfind() {
		return ProjectBoardDao.majorfind();
	}
}

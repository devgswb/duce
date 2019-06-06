
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

	int perPageNum = 15;		// 페이징 당 글 개수
	
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
		int min = pagingMin(page);	
		int max = perPageNum ; 								
//		System.out.println("page : " + page + "\nrealPagePin : " + min );
		List<ProjectBoardModel> resList = ProjectBoardDao.findPage(min, max);
		return resList;
	}

	@Override
	public List<String> findAllYear() {
		return ProjectBoardDao.findAllYear();
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

	@Override
	public List<ProjectBoardModel> findbyfilterMP(String major, int page) {
		int min = pagingMin(page);	
		int max = perPageNum ;
		List<ProjectBoardModel> resList = ProjectBoardDao.findbyfilterMP(major, min, max);
		return resList;
	}

	@Override
	public List<ProjectBoardModel> findbyfilterBP(String branch, int page) {	
		int min = pagingMin(page);		
		int max = perPageNum ; 								
		List<ProjectBoardModel> resList = ProjectBoardDao.findbyfilterBP(branch, min, max);
		return resList;
	}

	@Override
	public List<ProjectBoardModel> findbyfilterYP(String mYear, int page) {
		int min = pagingMin(page);		
		int max = perPageNum ; 								
		List<ProjectBoardModel> resList = ProjectBoardDao.findbyfilterYP(mYear, min, max);
		return resList;
	}

	@Override
	public List<ProjectBoardModel> findbyfilterP(String major, String branch, int page) {
		int min = pagingMin(page);		
		int max = perPageNum ; 								
		List<ProjectBoardModel> resList = ProjectBoardDao.findbyfilterP(major, branch, min, max);
		return resList;
	}

	@Override
	public List<ProjectBoardModel> findbyfilterYBP(String major, String branch, int page) {
		int min = pagingMin(page);		
		int max = perPageNum ; 								
		List<ProjectBoardModel> resList = ProjectBoardDao.findbyfilterYBP(major, branch, min, max);
		return resList;
	}

	@Override
	public List<ProjectBoardModel> findbyfilterYMP(String mYear, String major, int page) {
		int min = pagingMin(page);		
		int max = perPageNum ; 								
		List<ProjectBoardModel> resList = ProjectBoardDao.findbyfilterYMP(mYear, major, min, max);
		return resList;
	}

	@Override
	public List<ProjectBoardModel> findbyfilterYMBP(String mYear, String major, String branch, int page) {
		int min = pagingMin(page);		
		int max = perPageNum ; 								
		List<ProjectBoardModel> resList = ProjectBoardDao.findbyfilterYMBP(mYear, major, branch, min, max);
		return resList;
	}
	
	public List<ProjectBoardModel> searchProjectList(String query) {
		return ProjectBoardDao.searchProjectList(query);
	}
	
	@Override
	public List<ProjectBoardModel> searchProjectList(String query, int page) {
		int min = pagingMin(page);		
		int max = perPageNum ; 								
		List<ProjectBoardModel> resList = ProjectBoardDao.searchProjectListP(query, min, max);
		return resList;
	}
	
	public int pagingMin(int page) {
		if(page <= 0) {
			page = 1;
		}				
		int min = (page - 1) * perPageNum;		
		return min;
	}

	

	
	
}

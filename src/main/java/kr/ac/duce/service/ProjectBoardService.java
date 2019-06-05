package kr.ac.duce.service;
import java.util.List;

import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.ProjectBoardModel;

public interface ProjectBoardService {
	public List<ProjectBoardModel> findByNo(int pNo);
	public List<ProjectBoardModel> findAll();
	public List<ProjectBoardModel> findPage(int page);
	public List<String> findAllYear();
	public int getTopbNo();
	public void insert(ProjectBoardModel projectboard);
	public void update(ProjectBoardModel projectboard);
	public void delete(int pNo);
	public List<ProjectBoardModel> branchfind();
	public List<ProjectBoardModel> majorfind();
	public List<ProjectBoardModel> findbyfilter(String major, String branch);
	public List<ProjectBoardModel> findbyfilterM(String major);
	public List<ProjectBoardModel> findbyfilterB(String branch);
	public List<MajorCodeModel> majorCode();
	public List<BranchCodeModel> branchCode();
	public List<ProjectBoardModel> findbyfilterY(String mYear);
	public List<ProjectBoardModel> findbyfilterYB(String mYear, String branch);
	public List<ProjectBoardModel> findbyfilterYM(String mYear, String major);
	public List<ProjectBoardModel> findbyfilterYMB(String mYear, String major, String branch);
	public List<ProjectBoardModel> findbyfilterMP(String major, int page);
	public List<ProjectBoardModel> findbyfilterBP(String branch, int page);
	public List<ProjectBoardModel> findbyfilterYP(String mYear, int page);
	public List<ProjectBoardModel> findbyfilterP(String major, String branch, int page);
	public List<ProjectBoardModel> findbyfilterYBP(String major, String branch, int page);
	public List<ProjectBoardModel> findbyfilterYMP(String mYear, String major, int page);
	public List<ProjectBoardModel> findbyfilterYMBP(String major, String branch, String mYear, int page);
	public List<ProjectBoardModel> searchProjectList(String query);
	public List<ProjectBoardModel> searchProjectList(String query, int page);
}
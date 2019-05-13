package kr.ac.duce.service;
import java.util.List;

import kr.ac.duce.model.ProjectBoardModel;

public interface ProjectBoardService {
	public List<ProjectBoardModel> findByNo(int pNo);
	public List<ProjectBoardModel> findAll();
	public List<ProjectBoardModel> findPage(int page);
	public int getTopbNo();
	public void insert(ProjectBoardModel projectboard);
	public void update(ProjectBoardModel projectboard);
	public void delete(int pNo);
	public List<ProjectBoardModel> branchfind();
	public List<ProjectBoardModel> majorfind();
}
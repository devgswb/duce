package kr.ac.duce.service;
import java.util.List;

import kr.ac.duce.model.JsmBoardModel;

public interface JsmBoardService {
	public List<JsmBoardModel> findByNo(int no);
	public List<JsmBoardModel> findAll();
	public List<JsmBoardModel> findPage(int page);
	public int getTopNo();
	public void insert(JsmBoardModel jsmboard);
	public void update(JsmBoardModel jsmboard);
	public void delete(int no);
}
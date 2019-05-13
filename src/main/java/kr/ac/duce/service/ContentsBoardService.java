package kr.ac.duce.service;
import java.util.List;

import kr.ac.duce.model.ContentsBoardModel;

public interface ContentsBoardService {
	public List<ContentsBoardModel> findByNo(int bNo);
	public List<ContentsBoardModel> findAll();
	public List<ContentsBoardModel> findPage(int page);
	public int getTopbNo();
	public void insert(ContentsBoardModel lysboard);
	public void update(ContentsBoardModel lysboard);
	public void delete(int bNo);
}
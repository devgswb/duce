package kr.ac.duce.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.ac.duce.model.NoticeModel;
import kr.ac.duce.page.SearchCriteria;

public interface NoticeService {
	
//	public List<NoticeModel> findAll();
	public void insert(NoticeModel hsbBoard);
//	public List<NoticeModel> listPage(int page);
	public List<NoticeModel> findNum(int noticeNum);
	public void update(NoticeModel hsbBoard);
	public void delete(int noticeNum);
	public List<Map<String,Object>> searchNoticeList(SearchCriteria cri);
	public int countNoticeListTotal(SearchCriteria cri);
	public List<NoticeModel> prev(int noticeNum);
	public List<NoticeModel> next(int noticeNum);


}

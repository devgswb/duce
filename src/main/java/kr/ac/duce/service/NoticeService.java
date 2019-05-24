package kr.ac.duce.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.ac.duce.model.NoticeFileModel;
import kr.ac.duce.model.NoticeModel;
import kr.ac.duce.page.SearchCriteria;

public interface NoticeService {
	
	public void insert(NoticeModel noticeBoard);
	public void insertFile(NoticeFileModel noticeFile,HttpServletRequest request);
	public List<NoticeModel> findNum(int noticeNum);
	public void update(NoticeModel noticeBoard);
	public void updateFile(NoticeFileModel noticeFile);
	public void delete(int noticeNum);
	public void deleteFile(int noticeNum);
	public List<Map<String,Object>> searchNoticeList(SearchCriteria cri);
	public int countNoticeListTotal(SearchCriteria cri);
	public List<NoticeModel> prev(int noticeNum);
	public List<NoticeModel> next(int noticeNum);
	public Integer max(int max);
	public List<NoticeFileModel> fileName(int noticeNum);




}

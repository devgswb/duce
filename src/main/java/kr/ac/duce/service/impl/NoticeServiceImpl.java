package kr.ac.duce.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.NoticeDao;
import kr.ac.duce.model.NoticeFileModel;
import kr.ac.duce.model.NoticeModel;
import kr.ac.duce.page.SearchCriteria;
import kr.ac.duce.service.NoticeService;


@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao Dao;
	
	
	@Override
	public void insert(NoticeModel noticeBoard){
		Dao.insert(noticeBoard);	
		
	}
	
	@Override
	public void insertFile(NoticeFileModel noticeFile) {
		Dao.insertFile(noticeFile);
		
	}

	@Override
	public List<String> getFilesByNo(int noticeNum) {
		return Dao.getFilesByNo(noticeNum);
	}

	@Override
	public List<NoticeModel> findNum(int noticeNum) {
		Dao.updateHits(noticeNum);
		return Dao.findNum(noticeNum);	
	}

	@Override
	public void update(NoticeModel noticeBoard) {
		Dao.update(noticeBoard);
		
	}
	
	@Override
	public void updateFile(NoticeFileModel noticeFile){
		Dao.updateFile(noticeFile);
		
	}

	@Override
	public void delete(int noticeNum) {
		Dao.delete(noticeNum);
		
	}
	
	@Override
	public void deleteFile(int noticeNum) {
		Dao.deleteFile(noticeNum);
		
	}

	@Override
	public List<Map<String, Object>> searchNoticeList(SearchCriteria cri) {
		return Dao.searchNoticeList(cri);
	}

	@Override
	public int countNoticeListTotal(SearchCriteria cri) {
		return Dao.countNoticeListTotal(cri);
	}

	@Override
	public List<NoticeModel> prev(int noticeNum) {
		return Dao.prev(noticeNum);		
	}
	
	@Override
	public List<NoticeModel> next(int noticeNum) {
		return Dao.next(noticeNum);		
	}

	@Override
	public Integer max(int max) {
		return Dao.max(max);
	}
	
	public List<NoticeFileModel> fileName(int noticeNum){
		return Dao.fileName(noticeNum);
	}



	
	



	
	

}

package kr.ac.duce.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.NoticeDao;
import kr.ac.duce.model.NoticeModel;
import kr.ac.duce.page.SearchCriteria;
import kr.ac.duce.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao Dao;
	
//	@Override
//	public List<NoticeModel> findAll() {
//		return Dao.findAll();
//	}
	
	@Override
	public void insert(NoticeModel hsbBoard) {
		Dao.insert(hsbBoard);
	}

//	@Override
//	public List<NoticeModel> listPage(int page) {
//		int min = (page - 1) * 10;
//		int max = page * 10;
//		List<NoticeModel> resList = Dao.listPage(min, max);
//		return resList;	
//	}

	@Override
	public List<NoticeModel> findNum(int noticeNum) {
		Dao.updateHits(noticeNum);
		return Dao.findNum(noticeNum);	
	}

	@Override
	public void update(NoticeModel hsbBoard) {
		Dao.update(hsbBoard);
		
	}

	@Override
	public void delete(int noticeNum) {
		Dao.delete(noticeNum);
		
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

//	@Override
//	public List<NoticeModel> listSearch(SearchCriteria scri) {
//		return Dao.listSearch(scri);
//	}


	
	



	
	

}

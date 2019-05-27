package kr.ac.duce.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.FaqDao;
import kr.ac.duce.model.FaqModel;
import kr.ac.duce.page.SearchCriteria;
import kr.ac.duce.service.FaqService;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDao Dao;

	@Override
	public List<Map<String, Object>> searchFaqList(SearchCriteria cri) {
		return Dao.searchFaqList(cri);
	}

	@Override
	public int countFaqListTotal(SearchCriteria cri) {
		return Dao.countFaqListTotal(cri);
	}

	@Override
	public void insertFaq(FaqModel faqBoard) {
		Dao.insertFaq(faqBoard);
		
	}

	@Override
	public List<FaqModel> faqNum(int faqNum) {
		Dao.updateFaqHits(faqNum);
		return Dao.faqNum(faqNum);
	}

	@Override
	public void deleteFaq(int faqNum) {
		Dao.deleteFaq(faqNum);	
	}

	@Override
	public void updateFaq(FaqModel FaqBoard) {
		Dao.updateFaq(FaqBoard);
		
	}
	

}

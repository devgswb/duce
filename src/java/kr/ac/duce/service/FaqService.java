package kr.ac.duce.service;

import java.util.List;
import java.util.Map;


import kr.ac.duce.model.FaqModel;
import kr.ac.duce.page.SearchCriteria;

public interface FaqService {
	
	public List<Map<String, Object>> searchFaqList(SearchCriteria cri);
	public int countFaqListTotal(SearchCriteria cri);
	public void insertFaq(FaqModel faqBoard);
	public List<FaqModel> faqNum(int faqNum);
	public void deleteFaq(int faqNum);
	public void updateFaq(FaqModel FaqBoard);

}

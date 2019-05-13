
package kr.ac.duce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.ContentsBoardDao;
import kr.ac.duce.model.ContentsBoardModel;
import kr.ac.duce.service.ContentsBoardService;

@Service
public class ContentsBoardServiceImpl implements ContentsBoardService {

	@Autowired
	private ContentsBoardDao ContentsBoardDao;

	@Override
	public List<ContentsBoardModel> findByNo(int bNo) {
		return ContentsBoardDao.findbyNo(bNo);
	}

	@Override
	public void insert(ContentsBoardModel lysboard) {
		ContentsBoardDao.insert(lysboard);
	}

	@Override
	public void update(ContentsBoardModel lysboard) { 
		ContentsBoardDao.update(lysboard);
	}

	@Override
	public void delete(int bNo) {
		ContentsBoardDao.delete(bNo);
	}

	@Override
	public List<ContentsBoardModel> findAll() {
		return ContentsBoardDao.findAll();
	}

	@Override
	public List<ContentsBoardModel> findPage(int page) {
		int min = (page - 1) * 10;
		int max = page * 10;
		List<ContentsBoardModel> resList = ContentsBoardDao.findPage(min, max);
		return resList;
	}

	@Override
	public int getTopbNo() {
		ContentsBoardModel res = ContentsBoardDao.findPage(0, 1).get(0);
		return res.getbNo();
	}
}

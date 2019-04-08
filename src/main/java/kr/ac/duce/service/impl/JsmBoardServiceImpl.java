
package kr.ac.duce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.JsmBoardDao;
import kr.ac.duce.model.JsmBoardModel;
import kr.ac.duce.service.JsmBoardService;

@Service
public class JsmBoardServiceImpl implements JsmBoardService {

	@Autowired
	private JsmBoardDao JsmBoardDao;

	@Override
	public List<JsmBoardModel> findByNo(int no) {
		return JsmBoardDao.findbyNo(no);
	}

	@Override
	public void insert(JsmBoardModel jsmboard) {
		JsmBoardDao.insert(jsmboard);
	}

	@Override
	public void update(JsmBoardModel jsmboard) { 
		JsmBoardDao.update(jsmboard);
	}

	@Override
	public void delete(int no) {
		JsmBoardDao.delete(no);
	}

	@Override
	public List<JsmBoardModel> findAll() {
		return JsmBoardDao.findAll();
	}

	@Override
	public List<JsmBoardModel> findPage(int page) {
		int min = (page - 1) * 10;
		int max = page * 10;
		List<JsmBoardModel> resList = JsmBoardDao.findPage(min, max);
		return resList;
	}

	@Override
	public int getTopNo() {
		JsmBoardModel res = JsmBoardDao.findPage(0, 1).get(0);
		return res.getNo();
	}
}

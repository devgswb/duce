
package kr.ac.duce.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.duce.dao.BoardDao;
import kr.ac.duce.model.BoardModel;
import kr.ac.duce.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public BoardModel printBoard() {
		BoardModel board = dao.getBoard();
		return board;
	}
}

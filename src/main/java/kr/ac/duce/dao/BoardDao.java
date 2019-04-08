package kr.ac.duce.dao;
import kr.ac.duce.model.BoardModel;

public interface BoardDao {
	BoardModel getBoard();
	BoardModel delBoard();
}

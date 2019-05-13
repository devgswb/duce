package kr.ac.duce.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import kr.ac.duce.dao.UserDao;

@Repository
public class UserRepository {

	@Autowired
	UserDao userDao;

	private SqlSessionFactory sqlFact;
	
	//회원가입
	public UserModel register(UserModel usermodel, String role) {
		userDao.register(usermodel);
		return usermodel;
	}

	//아이디로 검색
	public UserModel findByid(String id) {
		return userDao.findByid(id);
	}

	//권한 가져오기
	public List<String> findauthoritiesbyid(String id){
		//쿼리문이 정확해도 에러가 나서 SqlSession으로 쿼리문 실행
		SqlSession session = sqlFact.openSession();
		List list = session.selectList(userDao.readAuthority(id), id);
		session.close();
		userDao.readAuthority(id);
		return list;
	}
}
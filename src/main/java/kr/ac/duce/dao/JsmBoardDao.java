package kr.ac.duce.dao;
import java.util.List;
import org.apache.ibatis.annotations.*;
import kr.ac.duce.model.JsmBoardModel;

public interface JsmBoardDao {
	@Select("SELECT * FROM jsmboard WHERE no = #{no}")
	public List<JsmBoardModel> findbyNo(@Param("no") int no);
	
	@Select("SELECT * FROM jsmboard ORDER BY no desc")
	public List<JsmBoardModel> findAll();
	
	@Select("SELECT * FROM jsmboard ORDER BY no desc limit #{min}, #{max}")
	public List<JsmBoardModel> findPage(int min, int max);
	
	@Insert("INSERT INTO jsmboard(no, writedate, writer, password, subject, content) "
			+ "VALUES(#{no}, #{writedate}, #{writer}, #{password}, #{subject}, #{content})")
	public void insert(JsmBoardModel jsmboard);
	
	@Update("UPDATE jsmboard SET subject=#{subject}, content=#{content} where no=#{no}")
	public void update(JsmBoardModel jsmboard);
	
	@Delete("DELETE FROM jsmboard where no=#{no}")
	public void delete(@Param("no") int no);

}

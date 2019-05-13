package kr.ac.duce.dao;
import java.util.List;
import org.apache.ibatis.annotations.*;
import kr.ac.duce.model.ContentsBoardModel;

public interface ContentsBoardDao {
	@Select("SELECT * FROM lysboard WHERE bNo = #{bNo}")
	public List<ContentsBoardModel> findbyNo(@Param("bNo") int bNo);
	
	@Select("SELECT * FROM lysboard ORDER BY bNo desc")
	public List<ContentsBoardModel> findAll();
	
	@Select("SELECT * FROM lysboard ORDER BY bNo desc limit #{min}, #{max}")
	public List<ContentsBoardModel> findPage(int min, int max);
	
	@Insert("INSERT INTO lysboard(userName, bTitle, bContent, bDate, bHit) "
			+ "VALUES(#{userName}, #{bTitle}, #{bContent}, #{bDate}, #{bHit})")
	public void insert(ContentsBoardModel lysboard);
	
	@Update("UPDATE lysboard SET bTitle=#{bTitle}, bContent=#{bContent} where bNo=#{bNo}")
	public void update(ContentsBoardModel lysboard);
	
	@Delete("DELETE FROM lysboard where bNo=#{bNo}")
	public void delete(@Param("bNo") int bNo);

}

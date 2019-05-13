package kr.ac.duce.dao;
import java.util.List;
import org.apache.ibatis.annotations.*;
import kr.ac.duce.model.ProjectBoardModel;

public interface ProjectBoardDao {
	@Select("SELECT * FROM projectboard WHERE pNo = #{pNo}")
	public List<ProjectBoardModel> findbyNo(@Param("pNo") int pNo);
	
	@Select("SELECT * FROM projectboard ORDER BY pNo desc")
	public List<ProjectBoardModel> findAll();
	
	@Select("SELECT * FROM projectboard ORDER BY pNo desc limit #{min}, #{max}")
	public List<ProjectBoardModel> findPage(int min, int max);
	
	@Select("SELECT * FROM projectboard pb, BranchCode bc WHERE pb.BranchNo = bc.BranchNo")
	public List<ProjectBoardModel> branchfind();
	
	@Select("SELECT * FROM projectboard pb, MajorCode mc WHERE pb.MajorNo = mc.MajorNo")
	public List<ProjectBoardModel> majorfind();
	
	@Insert("INSERT INTO projectboard(Title, Content, Part, Guide, BranchNo, MajorNo, id, pDate, Hit, Video, Photo) "
			+ "VALUES(#{title}, #{content}, #{part}, #{guide}, #{branchNo}, #{majorNo}, #{id}, #{pDate}, #{hit}, #{video}, #{photo})")
	public void insert(ProjectBoardModel projectboard);
	
	@Update("UPDATE projectboard SET Title=#{title}, Content=#{content}, Part=#{part}, Guide=#{guide}, BranchNo=#{branchNo}, MajorNo=#{majorNo}, Video=#{video}, Photo=#{photo} where pNo=#{pNo}")
	public void update(ProjectBoardModel projectboard);
	
	@Delete("DELETE FROM projectboard where pNo=#{pNo}")
	public void delete(@Param("pNo") int pNo);

}

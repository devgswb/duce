package kr.ac.duce.dao;
import java.util.List;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.ProjectBoardModel;

public interface ProjectBoardDao {
	@Select("SELECT * FROM projectboard WHERE pNo = #{pNo}")
	public List<ProjectBoardModel> findbyNo(@Param("pNo") int pNo);
	
	@Select("SELECT * FROM projectboard ORDER BY pNo desc")
	public List<ProjectBoardModel> findAll();
	
	@Select("SELECT * FROM projectboard ORDER BY pNo desc limit #{min}, #{max}")
	public List<ProjectBoardModel> findPage(int min, int max);

	@Select("select distinct YEAR(finishDate) from projectboard order by YEAR(finishDate) desc")
	public List<String> findAllYear();
//	@Select("SELECT * FROM projectboard pb, BranchCode bc WHERE pb.BranchNo = bc.BranchNo")
//	public List<ProjectBoardModel> branchfind();
//	
//	@Select("SELECT * FROM projectboard pb, MajorCode mc WHERE pb.MajorNo = mc.MajorNo")
//	public List<ProjectBoardModel> majorfind();
	
	@Insert("INSERT INTO projectboard(Title, Content, Part, Guide, BranchNo, MajorNo, id, pDate, startDate, finishDate, "
			+ "Hit, Video, Photo, addFile, reference) "
			+ "VALUES(#{title}, #{content}, #{part}, #{guide}, #{branchNo}, #{majorNo}, #{id}, #{pDate}, #{startDate}, #{finishDate}, "
			+ "#{hit}, #{video}, #{photo}, #{addFile}, #{reference})")
	public void insert(ProjectBoardModel projectboard);
	
	@Update("UPDATE projectboard SET Title=#{title}, Content=#{content}, Part=#{part}, Guide=#{guide}, startDate=#{startDate}, finishDate=#{finishDate}, "
			+ "BranchNo=#{branchNo}, MajorNo=#{majorNo}, Video=#{video}, Photo=#{photo}, AddFile=#{addFile}, reference=#{reference}"
			+ " where pNo=#{pNo}")
	public void update(ProjectBoardModel projectboard);
	
	@Delete("DELETE FROM projectboard where pNo=#{pNo}")
	public void delete(@Param("pNo") int pNo);
	// B
	@Select("SELECT * FROM projectboard WHERE BranchNo=#{branch} ORDER BY pNo desc")
	public List<ProjectBoardModel> findbyfilterB(@Param("branch") String branch);
	// M
	@Select("SELECT * FROM projectboard WHERE MajorNo=#{major} ORDER BY pNo desc")
	public List<ProjectBoardModel> findbyfilterM(@Param("major") String major);
	// Y
	@Select("SELECT * FROM projectboard WHERE YEAR(finishDate) Like CONCAT('%', #{mYear}, '%') ORDER BY pNo desc")
	public List<ProjectBoardModel>  findbyfilterY(@Param("mYear") String mYear);
	// M & B
	@Select("SELECT * FROM projectboard WHERE MajorNo=#{major} and BranchNo=#{branch} ORDER BY pNo desc")
	public List<ProjectBoardModel> findbyfilter(@Param("major") String major, @Param("branch") String branch);
	// Y & B
	@Select("SELECT * FROM projectboard WHERE YEAR(finishDate) Like CONCAT('%', #{mYear}, '%') and BranchNo=#{branch} ORDER BY pNo desc")
	public List<ProjectBoardModel> findbyfilterYB(@Param("mYear") String mYear, @Param("branch") String branch);
	// Y & M
	@Select("SELECT * FROM projectboard WHERE YEAR(finishDate) Like CONCAT('%', #{mYear}, '%') and MajorNo=#{major} ORDER BY pNo desc")
	public List<ProjectBoardModel> findbyfilterYM(@Param("mYear") String mYear, @Param("major") String major);
	// M & B & Y
	@Select("SELECT * FROM projectboard WHERE MajorNo=#{major} and BranchNo=#{branch} and YEAR(finishDate) Like CONCAT('%', #{mYear}, '%') ORDER BY pNo desc")
	public List<ProjectBoardModel> findbyfilterYMB(@Param("mYear") String mYear, @Param("major") String major, @Param("branch") String branch);
	
	@Select("SELECT * FROM BranchCode")
	public List<BranchCodeModel> branchCode();
	
	@Select("SELECT * FROM MajorCode")
	public List<MajorCodeModel> majorCode();
	
	
	
	
}

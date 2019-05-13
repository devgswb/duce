package kr.ac.duce.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import kr.ac.duce.model.NoticeModel;
import kr.ac.duce.page.PageCriteria;
import kr.ac.duce.page.SearchCriteria;

public interface NoticeDao {

//	@Select("SELECT * FROM hsbBoard ORDER BY noticeNum desc")
//	public List<NoticeModel> findAll();

//	@Select("SELECT * FROM hsbBoard ORDER BY noticeNum desc limit #{min}, #{max}")
//	public List<NoticeModel> listPage(int min, int max);
	
	//화면 뷰 
	@Select("SELECT * FROM hsbBoard WHERE noticeNum = #{noticeNum}")
	public List<NoticeModel> findNum(@Param("noticeNum") int noticeNum);
	
	// 입력 
	@Insert("INSERT INTO hsbBoard(noticeNum, noticeTitle, userID, noticeDate, noticeContent, noticeHits) "
			+ "VALUES((SELECT IFNULL(MAX(noticeNum)+1, 1) FROM hsbBoard b), #{noticeTitle}, #{userID}, #{noticeDate}, #{noticeContent}, #{noticeHits})")
	public void insert(NoticeModel hsbBoard);
	
	// 수정 
	@Update("UPDATE hsbBoard SET noticeTitle=#{noticeTitle}, noticeContent=#{noticeContent} where noticeNum=#{noticeNum}")
	public void update(NoticeModel hsbBoard);
	
	// 삭제
	@Delete("DELETE FROM hsbBoard WHERE noticeNum = #{noticeNum}")
	public void delete(@Param("noticeNum") int noticeNum);
	
	//목록 창 및 검색,페이지 
	@Select("SELECT * FROM hsbBoard WHERE IF(#{searchType} = 't',noticeTitle Like CONCAT('%', #{keyword}, '%'),"
			+ "IF(#{searchType} = 'c',noticeContent Like CONCAT('%', #{keyword}, '%'),"
			+ "noticeNum > 0))"
			+ "ORDER BY noticeNum DESC LIMIT #{pageStart}, #{perPageNum}")
	public List<Map<String, Object>> searchNoticeList(SearchCriteria cri);
	
	//전체 게시글 수 확인 
	@Select("SELECT COUNT(noticeNum) FROM hsbBoard WHERE "
			+ "IF(#{searchType} = 't',noticeTitle Like CONCAT('%', #{keyword}, '%'),"
			+ "IF(#{searchType} = 'c',noticeContent Like CONCAT('%', #{keyword}, '%'),noticeNum))")
	public int countNoticeListTotal(SearchCriteria cri);
	
	//조회 수 
	@Update("UPDATE hsbBoard SET noticeHits = noticeHits + 1 WHERE noticeNum = #{noticeNum}")
	public void updateHits(int noticeNum); 
	
//	@Select("SELECT noticeNum FROM hsbBoard WHERE noticeNum IN"
//			+ "((SELECT noticeNum FROM hsbBoard WHERE noticeNum < #{noticeNum} ORDER BY noticeNum DESC LIMIT 1),"
//			+ "(SELECT noticeNum FROM hsbBoard WHERE noticeNum > #{noticeNum} ORDER BY noticeNum LIMIT 1))")
//	public void prevNextpage(int noticeNum);
	
	@Select("SELECT * FROM hsbBoard WHERE noticeNum < #{noticeNum} ORDER BY noticeNum DESC LIMIT 1")
	public List<NoticeModel> prev(@Param("noticeNum") int noticeNum);

	@Select("SELECT * FROM hsbBoard WHERE noticeNum > #{noticeNum} ORDER BY noticeNum LIMIT 1")
	public List<NoticeModel> next(@Param("noticeNum") int noticeNum);
	
}
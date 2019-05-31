package kr.ac.duce.dao;

import java.util.List;
import java.util.Map;



import org.apache.ibatis.annotations.*;


import kr.ac.duce.model.NoticeFileModel;
import kr.ac.duce.model.NoticeModel;
import kr.ac.duce.page.SearchCriteria;

public interface NoticeDao {
	
	//화면 뷰 
	@Select("SELECT * FROM noticeBoard WHERE noticeNum = #{noticeNum}")
	public List<NoticeModel> findNum(@Param("noticeNum") int noticeNum);
	
	// 입력 
	@Insert("INSERT INTO noticeBoard(noticeNum, noticeTitle, userID, noticeDate, noticeContent, noticeHits) "
			+ "VALUES((SELECT IFNULL(MAX(a.noticeNum)+1, 1)FROM noticeBoard a), #{noticeTitle}, #{userID}, #{noticeDate}, #{noticeContent}, #{noticeHits})")
	public void insert(NoticeModel noticeBoard);
	
	// 첨부 파일 입력
	@Insert("INSERT INTO noticeFile(fileNum, fileSize, inFileName, outFileName, noticeNum) "
			+ "VALUES((SELECT IFNULL(MAX(b.fileNum)+1, 1)FROM noticeFile b),#{fileSize}, #{inFileName}, #{outFileName}, #{noticeNum})")
	public void insertFile(NoticeFileModel noticeFile);
	
	// 글 수정 
	@Update("UPDATE noticeBoard SET noticeTitle=#{noticeTitle}, noticeContent=#{noticeContent}, noticeDate=#{noticeDate} where noticeNum = #{noticeNum}")
	public void update(NoticeModel noticeBoard);
	
	// 파일 수정
	@Update("UPDATE noticeFile SET fileSize=#{fileSize}, inFileName=#{inFileName}, outFileName=#{outFileName}, noticeNum=#{noticeNum}")
	public void updateFile(NoticeFileModel noticeFile);
	
	// 글 삭제
	@Delete("DELETE FROM noticeBoard WHERE noticeNum = #{noticeNum}")
	public void delete(@Param("noticeNum") int noticeNum);
	
	// 파일 삭제
	@Delete("DELETE FROM noticeFile WHERE noticeNum = #{noticeNum}")
	public void deleteFile(@Param("noticeNum") int noticeNum);
	
	//목록 창 및 검색,페이지 
	@Select("SELECT * FROM noticeBoard WHERE IF(#{searchType} = 't',noticeTitle Like CONCAT('%', #{keyword}, '%'),"
			+ "IF(#{searchType} = 'c',noticeContent Like CONCAT('%', #{keyword}, '%'),"
			+ "noticeNum > 0))"
			+ "ORDER BY noticeNum DESC LIMIT #{pageStart}, #{perPageNum}")
	public List<Map<String, Object>> searchNoticeList(SearchCriteria cri);
	
	//전체 게시글 수 확인 
	@Select("SELECT COUNT(noticeNum) FROM noticeBoard WHERE "
			+ "IF(#{searchType} = 't',noticeTitle Like CONCAT('%', #{keyword}, '%'),"
			+ "IF(#{searchType} = 'c',noticeContent Like CONCAT('%', #{keyword}, '%'),noticeNum))")
	public int countNoticeListTotal(SearchCriteria cri);
	
	//조회 수 
	@Update("UPDATE noticeBoard SET noticeHits = noticeHits + 1 WHERE noticeNum = #{noticeNum}")
	public void updateHits(int noticeNum); 
	
	// 이전 페이지
	@Select("SELECT * FROM noticeBoard WHERE if(noticeNum > 1,noticeNum < #{noticeNum},1) ORDER BY noticeNum DESC LIMIT 1")
	public List<NoticeModel> prev(@Param("noticeNum") int noticeNum);
	
	// 다음 페이지
	@Select("SELECT * FROM noticeBoard WHERE IF(noticeNum <(SELECT MAX(noticeNum) from noticeBoard),"
			+ "noticeNum > #{noticeNum},(SELECT MAX(noticeNum) from noticeBoard)) "
			+ "ORDER BY noticeNum LIMIT 1")
	public List<NoticeModel> next(@Param("noticeNum") int noticeNum);
	
	// 최대값 구하기
	@Select("SELECT MAX(noticeNum) from noticeBoard")
	public Integer max(int max);  
	
	// 첨부 파일 조회
	@Select("SELECT * FROM noticeFile WHERE noticeNum = #{noticeNum}") 
	public List<NoticeFileModel> fileName (@Param("noticeNum") int noticeNum);
	

}
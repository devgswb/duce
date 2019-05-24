package kr.ac.duce.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.ac.duce.model.FaqModel;
import kr.ac.duce.page.SearchCriteria;

public interface FaqDao {
	
	@Select("SELECT * FROM faqBoard WHERE IF (#{searchBtn} = '결제' ,faqCategory Like CONCAT('%', #{searchBtn}, '%')"
			+ ",IF(#{searchBtn} = '로그인',faqCategory Like CONCAT('%', #{searchBtn}, '%'),"
			+ "IF(#{searchBtn} = '기타질문',faqCategory Like CONCAT('%', #{searchBtn}, '%'),faqNum > 0)))"
			+ "ORDER BY faqNum DESC LIMIT #{pageStart}, #{perPageNum}")
	public List<Map<String, Object>> searchFaqList(SearchCriteria cri);
	
	//전체 게시글 수 확인 
	@Select("SELECT COUNT(faqNum) FROM faqBoard WHERE IF (#{searchBtn} = '결제' ,faqCategory Like CONCAT('%', #{searchBtn}, '%'),"
			+ " IF(#{searchBtn} = '로그인',faqCategory Like CONCAT('%', #{searchBtn}, '%'),IF(#{searchBtn} = '기타질문',faqCategory Like CONCAT('%', #{searchBtn}, '%'),faqNum)))")
	public int countFaqListTotal(SearchCriteria cri);
	
	@Insert("INSERT INTO faqBoard(faqCategory, faqTitle, userID, faqDate, faqContent, faqHits) "
			+ "VALUES(#{faqCategory},#{faqTitle}, #{userID}, #{faqDate}, #{faqContent}, #{faqHits})")
	public void insertFaq(FaqModel faqBoard);
	
	@Select("SELECT * FROM faqBoard WHERE faqNum = #{faqNum}")
	public List<FaqModel> faqNum(@Param("faqNum") int faqNum);
	
	@Delete("DELETE FROM faqBoard WHERE faqNum = #{faqNum}")
	public void deleteFaq(@Param("faqNum") int faqNum);
	
	@Update("UPDATE faqBoard SET faqTitle=#{faqTitle}, faqContent=#{faqContent}, faqCategory=#{faqCategory}, faqDate=#{faqDate} where faqNum=#{faqNum}")
	public void updateFaq(FaqModel FaqBoard);
	
	@Update("UPDATE faqBoard SET faqHits = faqHits + 1 WHERE faqNum = #{faqNum}")
	public void updateFaqHits(int faqNum); 
	
	@Update("UPDATE faqBoard SET faqNum = faqNum - 1 WHERE faqNum >= #{faqNum} + 1")
	public void updateFaqNum(int faqNum);
}
package kr.ac.duce.dao;

import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Collection;
import java.util.List;

public interface MajorCodeDao {
    @Select("SELECT * FROM MajorCode")
    public List<MajorCodeModel> getMajorList();

    @Insert("Insert into MajorCode(MajorNo, Major) values(#{majorNo}, #{major})")
    public void addMajorCode(MajorCodeModel majorCodeModel);

    @Delete("DELETE FROM MajorCode WHERE majorNo = #{majorNo}")
    void deleteByNo(String majorNo);

    @Update("UPDATE MajorCode SET MajorNo=#{majorNo}, Major=#{major} Where MajorNo=#{former}")
    void updateMajor(MajorCodeModel majorCodeModel);
}

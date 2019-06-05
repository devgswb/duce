package kr.ac.duce.dao;

import kr.ac.duce.model.BranchCodeModel;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface BranchCodeDao {
    @Select("SELECT * FROM BranchCode")
    public List<BranchCodeModel> getBranchList();

    @Insert("Insert into BranchCode(BranchNo, Branch) values(#{branchNo}, #{branch})")
    public void addBranchCode(BranchCodeModel inputModel);

    @Delete("DELETE FROM BranchCode WHERE branchNo = #{branchNo}")
    void deleteByNo(String branchNo);

    @Update("UPDATE BranchCode SET BranchNo=#{branchNo}, Branch=#{branch} Where BranchNo=#{former}")
    void updateBranch(BranchCodeModel branch);
}

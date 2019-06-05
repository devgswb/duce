package kr.ac.duce.model;

public class BranchCodeModel {

	private String branchNo;
	private String branch;
	private String branchDet;
	//UPDATE에 쓰이는 파라미터
	private String former;
	
	public String getBranchNo() {
		return branchNo;
	}
	public void setBranchNo(String branchNo) {
		this.branchNo = branchNo;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getBranchDet() {
		return branchDet;
	}
	public void setBranchDet(String branchDet) {
		this.branchDet = branchDet;
	}
	public String getFormer() {
		return former;
	}

	public void setFormer(String former) {
		this.former = former;
	}
	
}

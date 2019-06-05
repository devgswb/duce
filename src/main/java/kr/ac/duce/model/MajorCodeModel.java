package kr.ac.duce.model;

public class MajorCodeModel {

	private String majorNo;
	private String major;
	private String majorDet;
	//UPDATE에 쓰이는 파라미터
	private String former;
	
	public String getMajorNo() {
		return majorNo;
	}
	public void setMajorNo(String majorNo) {
		this.majorNo = majorNo;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getMajorDet() {
		return majorDet;
	}
	public void setMajorDet(String majorDet) {
		this.majorDet = majorDet;
	}
	public String getFormer() {
		return former;
	}

	public void setFormer(String former) {
		this.former = former;
	}
}

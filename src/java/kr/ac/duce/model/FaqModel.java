package kr.ac.duce.model;

import java.util.Date;

public class FaqModel {

	private int faqNum;
	private String faqTitle;
	private String userID;
	private String faqContent;
	private Date faqDate;
	private int faqHits;
	
	public int getFaqNum() {
		return faqNum;
	}
	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Date getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}
	public int getFaqHits() {
		return faqHits;
	}
	public void setFaqHits(int faqHits) {
		this.faqHits = faqHits;
	}
	
}

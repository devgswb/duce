
package kr.ac.duce.model;

import java.util.Date;

public class NoticeModel {

	private int noticeNum;
	private String noticeTitle;
	private String userID;
	private Date noticeDate;
	private String noticeContent;
	private int noticeHits;
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getNoticeHits() {
		return noticeHits;
	}
	public void setNoticeHits(int noticeHits) {
		this.noticeHits = noticeHits;
	}
	
	
}

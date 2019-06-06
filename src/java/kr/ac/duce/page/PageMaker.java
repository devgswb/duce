package kr.ac.duce.page;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private PageCriteria cri;
	private boolean prevPageNum; //이전페이지
	private boolean nextPageNum; //다음 페이지
	private int startPageNum; // 시작 페이지
	private int endPageNum; // 끝 페이지
	private int totalCount; // 게시 글 전체 수
	private int displayPageNum = 5;
	
	public PageCriteria getCri() {
		return cri;
	}
	
	public void setCri(PageCriteria cri) {
		this.cri = cri;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		pageData();
		
	}
	// Math.ceil 올림 Math.floor 버림 Math.round 반올림 
	private void pageData() {
		endPageNum = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		startPageNum = (endPageNum-displayPageNum) + 1;
		int tEndPageNum = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		if(endPageNum > tEndPageNum) {
			endPageNum = tEndPageNum;
		}
//		if(endPageNum < displayPageNum ) {
//			startPageNum = 1;
//		}
//		else {
//			startPageNum = (endPageNum - displayPageNum) + 1;
//		}
//		
		prevPageNum = startPageNum == 1 ? false : true;
		nextPageNum = endPageNum * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public int getStartPageNum() {
		return startPageNum;
	}
	
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	
	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public boolean getPrevPageNum() {
		return prevPageNum;
	}

	public void setPrevPageNum(boolean prevPageNum) {
		this.prevPageNum = prevPageNum;
	}

	public boolean getNextPageNum() {
		return nextPageNum;
	}

	public void setNextPageNum(boolean nextPageNum) {
		this.nextPageNum = nextPageNum;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public String makeQuery(int page) {
	    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
	        .queryParam("perPageNum", cri.getPerPageNum()).build();
	    return uriComponents.toUriString();
	  }
	
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
		.queryParam("page",page)
		.queryParam("perPageNum",cri.getPerPageNum())
		.queryParam("searchType",((SearchCriteria)cri).getSearchType())
		.queryParam("keyword",((SearchCriteria)cri).getKeyword())
		.build();
		
		return uriComponents.toUriString();
	}
				
}

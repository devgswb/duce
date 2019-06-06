package kr.ac.duce.page;

public class Paging {
	
	private int pageCount;
	private int pageStart;
	private int pageEnd;
	private boolean isPrev;
	private boolean isNext;
	
	public void setPaging (int page, int writingCount, int perPageNum, int displayPageNum) {
		pageCount = ( ( writingCount - 1 ) / perPageNum) + 1 ;
		pageStart = ( ( page - 1 ) / displayPageNum)  * displayPageNum + 1;
		pageEnd = Math.min(pageStart + displayPageNum - 1, pageCount);
		isPrev = page >= displayPageNum + 1;
		isNext = pageEnd < pageCount ;
		
		setPageCount(pageCount);
		setPageStart(pageStart);
		setPageEnd(pageEnd);
		setPrev(isPrev);
		setNext(isNext);
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public boolean isPrev() {
		return isPrev;
	}

	public void setPrev(boolean isPrev) {
		this.isPrev = isPrev;
	}

	public boolean isNext() {
		return isNext;
	}

	public void setNext(boolean isNext) {
		this.isNext = isNext;
	}
	
	
}
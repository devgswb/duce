package kr.ac.duce.page;

public class PageCriteria {
	private int page; // 현재 페이지 번호
	private int perPageNum; // 한페이지당 보여줄 게시글 갯수 
	
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
	
	public PageCriteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		}
		else {
			this.page = page;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int pageCount) { 
		 if (perPageNum <= 0 || perPageNum > 50) {

		      this.perPageNum = 10;

		      return;

		    }
		    this.perPageNum = pageCount;
	}
	
}

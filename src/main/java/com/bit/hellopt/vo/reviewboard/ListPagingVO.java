package com.bit.hellopt.vo.reviewboard;

public class ListPagingVO {
	
	private int startRow;
	private int endRow;
	
	//현재 페이지
	private int pageIndex = 1;
	
	//페이지 사이즈
	private int pageSize = 10; //한 페이지에 나오는 게시물 수
	
	private int pageGroupSize = 3; //페이지 번호 몇개 보여줄 지

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageGroupSize() {
		return pageGroupSize;
	}

	public void setPageGroupSize(int pageGroupSize) {
		this.pageGroupSize = pageGroupSize;
	}

	@Override
	public String toString() {
		return "ListPagingVO [startRow=" + startRow + ", endRow=" + endRow + ", pageIndex=" + pageIndex + ", pageSize="
				+ pageSize + ", pageGroupSize=" + pageGroupSize + "]";
	}

	
	
}

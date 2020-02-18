package com.bit.hellopt.vo.reviewboard;

public class ReviewFileVO {
	
	private String REV_FILE_ONAME;
	private String REV_FILE_SNAME;
	private long REV_FILE_SIZE;
	private int REV_IDX;
	public String getREV_FILE_ONAME() {
		return REV_FILE_ONAME;
	}
	public void setREV_FILE_ONAME(String rEV_FILE_ONAME) {
		REV_FILE_ONAME = rEV_FILE_ONAME;
	}
	public String getREV_FILE_SNAME() {
		return REV_FILE_SNAME;
	}
	public void setREV_FILE_SNAME(String rEV_FILE_SNAME) {
		REV_FILE_SNAME = rEV_FILE_SNAME;
	}
	public long getREV_FILE_SIZE() {
		return REV_FILE_SIZE;
	}
	public void setREV_FILE_SIZE(long rEV_FILE_SIZE) {
		REV_FILE_SIZE = rEV_FILE_SIZE;
	}
	public int getREV_IDX() {
		return REV_IDX;
	}
	public void setREV_IDX(int rEV_IDX) {
		REV_IDX = rEV_IDX;
	}
	@Override
	public String toString() {
		return "ReviewFileVO [REV_FILE_ONAME=" + REV_FILE_ONAME + ", REV_FILE_SNAME=" + REV_FILE_SNAME
				+ ", REV_FILE_SIZE=" + REV_FILE_SIZE + ", REV_IDX=" + REV_IDX + "]";
	}
	
	
}

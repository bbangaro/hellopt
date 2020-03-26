package com.bit.hellopt.vo.reviewboard;

import java.util.Date;

public class RCommentVO {

	private Integer revCmtIdx;	//댓글 번호
	private Integer revIdx;		//게시글 번호
	private String userId;
	private String userName;
	private String revCmtComment;
	private String revCmtRegdate;
	private String revCmtEditdate;
	
	public int getRevCmtIdx() {
		return revCmtIdx;
	}
	public void setRevCmtIdx(Integer revCmtIdx) {
		this.revCmtIdx = revCmtIdx;
	}
	public int getRevIdx() {
		return revIdx;
	}
	public void setRevIdx(Integer revIdx) {
		this.revIdx = revIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRevCmtComment() {
		return revCmtComment;
	}
	public void setRevCmtComment(String revCmtComment) {
		this.revCmtComment = revCmtComment;
	}
	public String getRevCmtRegdate() {
		return revCmtRegdate;
	}
	public void setRevCmtRegdate(String revCmtRegdate) {
		this.revCmtRegdate = revCmtRegdate;
	}
	public String getRevCmtEditdate() {
		return revCmtEditdate;
	}
	public void setRevCmtEditdate(String revCmtEditdate) {
		this.revCmtEditdate = revCmtEditdate;
	}
	@Override
	public String toString() {
		return "RCommentVO [revCmtIdx=" + revCmtIdx + ", revIdx=" + revIdx + ", userId=" + userId + ", userName="
				+ userName + ", revCmtComment=" + revCmtComment + ", revCmtRegdate=" + revCmtRegdate
				+ ", revCmtEditdate=" + revCmtEditdate + "]";
	}
	
	
	
}

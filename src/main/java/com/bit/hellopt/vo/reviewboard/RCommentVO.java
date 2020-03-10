package com.bit.hellopt.vo.reviewboard;

import java.util.Date;

public class RCommentVO {

	private int revCmtIdx;	//댓글 번호
	private int revIdx;		//게시글 번호
	private String userId;
	private String userName;
	private String revCmtComment;
	private Date revCmtRegdate;
	
	public int getRevCmtIdx() {
		return revCmtIdx;
	}
	
	public int getRevIdx() {
		return revIdx;
	}

	public void setRevIdx(int revIdx) {
		this.revIdx = revIdx;
	}

	public void setRevCmtIdx(int revCmtIdx) {
		this.revCmtIdx = revCmtIdx;
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
	public Date getRevCmtRegdate() {
		return revCmtRegdate;
	}
	public void setRevCmtRegdate(Date revCmtRegdate) {
		this.revCmtRegdate = revCmtRegdate;
	}
	
	@Override
	public String toString() {
		return "RCommentVO [revCmtIdx=" + revCmtIdx + ", revIdx=" + revIdx + ", userId=" + userId + ", userName="
				+ userName + ", revCmtComment=" + revCmtComment + ", revCmtRegdate=" + revCmtRegdate + "]";
	}

	
}

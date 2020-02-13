package com.bit.hellopt.vo.reviewboard;

import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import com.bit.hellopt.vo.User;

public class ReviewBoardVO {
	private int revIdx;
	private User user;
	private String revContent;
	private Date revRegdate;
	private int revHit;
	private int revStar;
	private String revCategory;
	private MultipartFile revFile;
	public int getRevIdx() {
		return revIdx;
	}
	public void setRevIdx(int revIdx) {
		this.revIdx = revIdx;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public Date getRevRegdate() {
		return revRegdate;
	}
	public void setRevRegdate(Date revRegdate) {
		this.revRegdate = revRegdate;
	}
	public int getRevHit() {
		return revHit;
	}
	public void setRevHit(int revHit) {
		this.revHit = revHit;
	}
	public int getRevStar() {
		return revStar;
	}
	public void setRevStar(int revStar) {
		this.revStar = revStar;
	}
	public String getRevCategory() {
		return revCategory;
	}
	public void setRevCategory(String revCategory) {
		this.revCategory = revCategory;
	}
	public MultipartFile getRevFile() {
		return revFile;
	}
	public void setRevFile(MultipartFile revFile) {
		this.revFile = revFile;
	}
	@Override
	public String toString() {
		return "ReviewBoardVO [revIdx=" + revIdx + ", user=" + user + ", revContent=" + revContent + ", revRegdate="
				+ revRegdate + ", revHit=" + revHit + ", revStar=" + revStar + ", revCategory=" + revCategory
				+ ", revFile=" + revFile + "]";
	}
	

	
	
	
}
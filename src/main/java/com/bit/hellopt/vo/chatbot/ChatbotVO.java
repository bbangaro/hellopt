package com.bit.hellopt.vo.chatbot;

public class ChatbotVO {
	
	private String chatting_content, nxt_content;
	private int chatting_idx, nxt_idx;
	
	public ChatbotVO() {}

	public String getChatting_content() {
		return chatting_content;
	}

	public void setChatting_content(String chatting_content) {
		this.chatting_content = chatting_content;
	}

	public String getNxt_content() {
		return nxt_content;
	}

	public void setNxt_content(String nxt_content) {
		this.nxt_content = nxt_content;
	}

	public int getChatting_idx() {
		return chatting_idx;
	}

	public void setChatting_idx(int chatting_idx) {
		this.chatting_idx = chatting_idx;
	}

	public int getNxt_idx() {
		return nxt_idx;
	}

	public void setNxt_idx(int nxt_idx) {
		this.nxt_idx = nxt_idx;
	}

	@Override
	public String toString() {
		return "ChatbotVO [chatting_content=" + chatting_content + ", nxt_content=" + nxt_content + ", chatting_idx="
				+ chatting_idx + ", nxt_idx=" + nxt_idx + "]";
	}
	
}

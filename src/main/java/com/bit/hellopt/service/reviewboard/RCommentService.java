package com.bit.hellopt.service.reviewboard;

import java.util.List;

import com.bit.hellopt.vo.reviewboard.RCommentVO;

public interface RCommentService {
	
	//댓글 목록
	public List<RCommentVO> list(int revIdx);
	
	//댓글 입력
	public void create(RCommentVO vo);
	
	//댓글 수정
	public void update(RCommentVO vo);
	
	//댓글 삭제
	public void delete(int revCmtIdx);
}

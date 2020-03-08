package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.reviewboard.RCommentVO;

public interface RCommentMapper {
	
	//댓글 목록
	@Select("SELECT * FROM REVIEW_COMMENT_TB ORDER BY REV_CMT_IDX DESC ")
	public List<RCommentVO> list(int revIdx);
	
	//댓글 작성
	@Insert("INSERT INTO REVIEW_COMMENT_TB (REV_CMT_IDX, USER_ID, USER_NAME, REV_CMT_COMMENT)"
			+ "VALUES(review_comment_tb.nextval, #{userId}, #{userName}, #{revCmtComment})")
	public void create(RCommentVO vo);
	
	//댓글 수정
	public void update(RCommentVO vo);
	
	//댓글 삭제
	public void delete(int revCmtIdx);
}

package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	@Update("UPDATE REVIEW_COMMENT_TB "
			+ "SET REV_CMT_COMMENT = #{revCmtComment}"
			+ "WHERE REV_CMT IDX=#{revCmtIdx}")
	public void update(RCommentVO vo);
	
	@Delete("DELETE FROM REVIEW_COMMENT_TB WHERE REV_CMT_IDX= #{revCmtIdx}")
	public void delete(int revCmtIdx);
}

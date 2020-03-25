package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bit.hellopt.vo.reviewboard.RCommentVO;

public interface RCommentMapper {
	
	//댓글 목록
	@Select("SELECT * FROM REVIEW_COMMENT_TB WHERE REV_IDX = #{revIdx} ORDER BY REV_CMT_REGDATE DESC ")
	public List<RCommentVO> cmtList(int revIdx);
	
	//댓글 작성
	@Insert("INSERT INTO REVIEW_COMMENT_TB (REV_CMT_IDX, USER_ID, USER_NAME, REV_CMT_COMMENT, REV_IDX)"
			+ "VALUES(REV_COMMENT_TB_SEQ.nextval, #{userId}, #{userName}, #{revCmtComment}, #{revIdx})")
	public void cmtCreate(RCommentVO vo);
	
	//댓글 수정
	@Update("UPDATE REVIEW_COMMENT_TB "
			+ "SET REV_CMT_COMMENT = #{revCmtComment}"
			+ "WHERE REV_CMT IDX=#{revCmtIdx}")
	public void cmtUpdate(RCommentVO vo);
	
	@Delete("DELETE FROM REVIEW_COMMENT_TB WHERE REV_CMT_IDX= #{revCmtIdx}")
	public void cmtDelete(int revCmtIdx);
}

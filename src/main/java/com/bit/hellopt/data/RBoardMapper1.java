package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bit.hellopt.vo.reviewboard.RBoardVO;

public interface RBoardMapper1 {

	//전체 후기 조회
	
	@Select("SELECT * FROM REVIEW_BOARD_TB ORDER BY REV_IDX DESC")
	public List<RBoardVO> getRBoardList();
	
	@Select("SELECT USER_ID, USER_ROLE, USER_NAME, USER_GENDER, USER_ADDRESS,"
			+ " USER_JOB, USER_BIRTH, USER_ROOT, USER_HEIGHT, USER_WEIGHT, "
			+ "USER_PROFILE FROM REVIEW_BOARD_TB RBT, USERS_TB UT"
			+ "WHERE RBT.FK_USER_ID = UT.USER_ID ORDER BY REV_IDX DESC")
	
	public void selectUser(); 
	
	@Insert("INSERT INTO REVIEW_BOARD_TB (REV_IDX, REV_STAR, REV_CONTENT)\r\n" + 
			"		VALUES ((SELECT NVL(MAX(REV_IDX), 0) + 1 FROM REVIEW_BOARD_TB), \r\n" + 
			"		       #{revStar}, #{revContent})")
	public void insertRBoard(RBoardVO vo);
	
	
	@Insert("INSERT INTO REVIEW_BOARD_TB "
			+ "(REV_IDX,REV_STAR, REV_CONTENT, REV_FILE_ORIGIN, REV_FILE_SAVE)\r\n" + 
			"VALUES((SELECT NVL(MAX(REV_IDX)+1, 0) FROM REVIEW_BOARD_TB),\r\n" + 
			"		#{revStar}, #{revContent}, #{revFileOrigin}, #{revFileSave})")
	public void insertRBoardUploadFile(RBoardVO vo);
	
	@Update("UPDATE REVIEW_BOARD_TB\r\n" + 
			"			SET REV_STAR = #{revStar},\r\n" + 
			"				REV_CONTENT = #{revContent},\r\n" + 
			"		WHERE REV_IDX = #{revIdx}")
	public void updateRBoard(RBoardVO vo);
	
	@Delete("DELETE FROM REVIEW_BOARD_TB WHERE REV_IDX = #{revIdx}")
	public void deleteRBoard(RBoardVO vo);
}

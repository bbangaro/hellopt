package com.bit.hellopt.data;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bit.hellopt.vo.reviewboard.RBoardVO;
import com.bit.hellopt.vo.reviewboard.RFileVO;

public interface RBoardMapper1 {

	//전체 후기 조회
	
	@Select("SELECT * FROM REVIEW_BOARD_TB ORDER BY REV_IDX DESC")
	public List<RBoardVO> getRBoardList();
	
	@Select("SELECT * FROM REVIEW_FILE_TB WHERE REV_IDX= #{revIdx}")
	public List<RFileVO> getFileList(int revIdx);
	
	@Select("SELECT USER_ID, USER_ROLE, USER_NAME, USER_GENDER, USER_ADDRESS,"
			+ " USER_JOB, USER_BIRTH, USER_ROOT, USER_HEIGHT, USER_WEIGHT, "
			+ "USER_PROFILE FROM REVIEW_BOARD_TB RBT, USERS_TB UT"
			+ "WHERE RBT.FK_USER_ID = UT.USER_ID ORDER BY REV_IDX DESC")
	public void selectUser(); 
	
	@Select("SELECT REV_FILE_SNAME FROM REVIEW_FILE_TB"
			+ "WHERE RBT.REV_IDX = RFT.REV_IDX AND RFT.REV_IDX =#{revIdx} ORDER BY REV_FILE_IDX DESC")
	public List<RFileVO> selectFile(); 
	
	
	@Insert("INSERT INTO REVIEW_BOARD_TB (REV_IDX, REV_STAR, REV_CONTENT)\r\n" + 
			"		VALUES ((SELECT NVL(MAX(REV_IDX), 0) + 1 FROM REVIEW_BOARD_TB), \r\n" + 
			"		       #{revStar}, #{revContent})")
	public void insertRBoard(RBoardVO vo);
	
	@Update("UPDATE REVIEW_BOARD_TB\r\n" + 
			"			SET REV_STAR = #{revStar},\r\n" + 
			"				REV_CONTENT = #{revContent},\r\n" + 
			"		WHERE REV_IDX = #{revIdx}")
	public void updateRBoard(RBoardVO vo);
	
	@Delete("DELETE FROM REVIEW_BOARD_TB WHERE REV_IDX = #{revIdx}")
	public void deleteRBoard(RBoardVO vo);

	//파일 저장용 db에 입력하는 것...
	@Insert("INSERT INTO REVIEW_FILE_TB(REV_FILE_IDX, REV_FILE_ONAME, REV_FILE_SNAME, REV_FILE_SIZE, REV_IDX)\r\n" + 
			"VALUES(review_file_tb_seq.nextval,"
			+ " #{revFileOname}, #{revFileSname}, #{revFileSize}, (SELECT NVL(MAX(REV_IDX), 0) FROM REVIEW_BOARD_TB) )")
	public void uploadFile(HashMap<String, Object> hm);
	
}

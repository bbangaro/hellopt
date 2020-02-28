package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bit.hellopt.vo.meeting.CategoryCodeVO;
import com.bit.hellopt.vo.meeting.LocalVO;
import com.bit.hellopt.vo.meeting.MeetingVO;

public interface MeetingMapper {
	
	@Select("SELECT MEETING_IDX, FK_USER_ID, M_COMMENT, C.M_CATEGORY, L.LOCAL, M_DATE, M_SUBJECT, M_MEMO, DETAILS, INCLUDE, M_LOCATION, M_LOCATION_C, M_PRICE, PROGRESS_ST, M_CNT, INS_DT " + 
			"FROM MEETING_TB M, M_CATEGORY_CODE_TB C, LOCAL_CODE_TB L " + 
			"WHERE M.FK_M_CATEGORY_NO = C.M_CATEGORY_NO " + 
			"  AND M.FK_LOCAL_NO = L.LOCAL_NO ")
	public List<MeetingVO> getMeetingVO();
	
	@Select("SELECT * FROM LOCAL_CODE_TB")
	public List<LocalVO> getLocalVO();
	
	@Select("SELECT * FROM M_CATEGORY_CODE_TB")
	public List<CategoryCodeVO> getCategoryCodeVO();
	
	
	
	@Select("SELECT MEETING_IDX, FK_USER_ID, M_COMMENT, C.M_CATEGORY, L.LOCAL, M_DATE, M_SUBJECT, M_MEMO, DETAILS, INCLUDE, M_LOCATION, M_LOCATION_C, M_PRICE, PROGRESS_ST, M_CNT, INS_DT, U.USER_NAME " + 
			"FROM MEETING_TB M, M_CATEGORY_CODE_TB C, LOCAL_CODE_TB L, USERS_TB U " + 
			"WHERE M.FK_M_CATEGORY_NO = C.M_CATEGORY_NO " + 
			"  AND M.FK_LOCAL_NO = L.LOCAL_NO " +
			"  AND M.FK_USER_ID = U.USER_ID " +
			"  AND MEETING_IDX = #{meetingIdx}")
	public MeetingVO getMeetingOne(int meetingIdx);
	
	@Insert("INSERT INTO MEETING_TB " + 
			"  (MEETING_IDX, FK_USER_ID, M_COMMENT, FK_M_CATEGORY_NO, FK_LOCAL_NO, M_DATE, M_SUBJECT, M_MEMO, DETAILS, INCLUDE, M_LOCATION, M_LOCATION_C, M_PRICE, PROGRESS_ST, M_CNT, INS_DT) " + 
			"VALUES " + 
			"  (MEETING_TB_SEQ.NEXTVAL, #{fkUserId}, #{mComment}, #{fkMCategoryNo}, #{fkLocalNo}, " + 
			"  #{mDate}, #{mSubject}, #{mMemo}, #{details}, #{include} , #{mLocation}, #{mLocationC}, #{mPrice}, '진행중', 0, SYSDATE ) " ) 
	public void insertMeeting(com.bit.hellopt.vo.meeting.MeetingVO meetingVO);
	
	@Update("UPDATE MEETING_TB SET " + 
			"  M_COMMENT = #{mComment} , FK_M_CATEGORY_NO = #{fkMCategoryNo}, FK_LOCAL_NO = #{fkLocalNo} , " +
			"  M_DATE= #{mDate} , M_SUBJECT = #{mSubject}, M_MEMO = #{mMemo}, DETAILS = #{details}, INCLUDE = #{include}, " +
			"  M_LOCATION = #{mLocation}, M_LOCATION_C = #{mLocationC}, M_PRICE = #{mPrice}, INS_DT = SYSDATE " + 
			"  WHERE  MEETING_IDX = #{meetingIdx} " )
	public void updateMeeting(com.bit.hellopt.vo.meeting.MeetingVO meetingVO);
	
	@Delete("DELETE FROM MEETING_TB WHERE MEETING_IDX = #{meetingIdx} ")
	public void deleteMeeting(int meetingIdx);
	
}

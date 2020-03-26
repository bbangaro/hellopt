package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bit.hellopt.vo.live.LiveClass;

public interface LiveClassMapper {
	@Insert("INSERT INTO CLASS_TB (CLASS_IDX, "
			+ "FK_USER_ID, CLASS_TYPE, CLASS_NAME, TOTAL_MEMBERS, PRICE, CLASS_LENGTH, "
			+ "CLASS_START_DATE, CLASS_TIME, CLASS_DAY, LIVE_STATUS, TOTAL_VIEWER) "
			+ "VALUES (CLASS_TB_SEQ.NEXTVAL, "
			+ "#{fkUserId}, #{classType}, #{className}, #{totalMembers}, #{price}, #{classLength}, "
			+ "#{classStartDate}, #{classTime}, #{classDay}, '방송예정', 0)")
	public void insertClass(com.bit.hellopt.vo.live.LiveClass liveClass);
	
	@Select("SELECT * FROM CLASS_TB ORDER BY CLASS_IDX DESC")
	public List<LiveClass> getLiveClass();
	
	@Select("SELECT * FROM CLASS_TB WHERE CLASS_IDX = #{classIdx}")
	public LiveClass getClassDetail(int classIdx);
	
	@Delete("DELETE FROM CLASS_TB WHERE CLASS_IDX = #{classIdx}")
	public void deleteClass(int classIdx);
	
	@Update("UPDATE CLASS_TB SET CLASS_TYPE = #{classType}, CLASS_NAME = #{className}, "
			+ " TOTAL_MEMBERS = #{totalMembers}, PRICE = #{price}, CLASS_LENGTH = #{classLength}, "
			+ " CLASS_START_DATE = #{classStartDate}, CLASS_TIME = #{classTime}, CLASS_DAY = #{classDay} "
			+ " WHERE CLASS_IDX = #{classIdx} ")
	public void updateClass(LiveClass liveClass);
}

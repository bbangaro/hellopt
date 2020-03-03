package com.bit.hellopt.vo.exercise;

import org.springframework.web.multipart.MultipartFile;


/* USERS_TB Table Create SQL
CREATE TABLE EXCERCISE_INFORMATION_TB
(
    EXERCISE_IDX        NUMBER(5)        NOT NULL, 
    EXERCISE_NAME       VARCHAR2(20)     NOT NULL, 
    EXERCISE_PARTS      VARCHAR2(20)     NOT NULL, 
    EXERCISE_PICTURES    VARCHAR2(100)    NOT NULL, 
    EXERCISE_VIDEO      VARCHAR2(100)    NOT NULL, 
    CAUTION             VARCHAR2(500)    NOT NULL, 
    REPETITION          NUMBER(5)        NOT NULL, 
    SET_COUNT           NUMBER(5)        NOT NULL, 
    REST_TIME           NUMBER(5)        NOT NULL, 
    CONSTRAINT EXCERCISE_INFORMATION_TB_PK PRIMARY KEY (EXERCISE_IDX)
)
/

CREATE SEQUENCE EXCERCISE_INFORMATION_TB_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER EXCERCISE_INFORMATION_T_AI_TRG
BEFORE INSERT ON EXCERCISE_INFORMATION_TB 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT EXCERCISE_INFORMATION_TB_SEQ.NEXTVAL
    INTO :NEW.EXERCISE_IDX
    FROM DUAL;
END;
*/

public class ExerciseInformationVO {
	private int exerciseIdx;
	private String exerciseName;
	private String exerciseParts;
	private String howtoExercise;
	private String exercisePicturesName;
	private String exerciseVideo;
	private String caution;
	private int repetition;
	private int setCount;
	private int restTime;
	
	//검색조건용 필드 추가
	private String searchCondition;
	private String searchKeyword;
	
	//파일업로드
	private MultipartFile uploadFile;
	
	public ExerciseInformationVO() {
		//System.out.println(">> ExerciseInformationVO 객체 생성");
	}

	public int getExerciseIdx() {
		return exerciseIdx;
	}

	public void setExerciseIdx(int exerciseIdx) {
		this.exerciseIdx = exerciseIdx;
	}

	public String getExerciseName() {
		return exerciseName;
	}

	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}

	public String getExerciseParts() {
		return exerciseParts;
	}

	public void setExerciseParts(String exerciseParts) {
		this.exerciseParts = exerciseParts;
	}
	
	public String getHowtoExercise() {
		return howtoExercise;
	}

	public void setHowtoExercise(String howtoExercise) {
		this.howtoExercise = howtoExercise;
	}

	public String getExercisePicturesName() {
		return exercisePicturesName;
	}

	public void setExercisePicturesName(String exercisePicturesName) {
		this.exercisePicturesName = exercisePicturesName;
	}

	public String getExerciseVideo() {
		return exerciseVideo;
	}

	public void setExerciseVideo(String exerciseVideo) {
		this.exerciseVideo = exerciseVideo;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}

	public int getRepetition() {
		return repetition;
	}

	public void setRepetition(int repetition) {
		this.repetition = repetition;
	}

	public int getSetCount() {
		return setCount;
	}

	public void setSetCount(int setCount) {
		this.setCount = setCount;
	}

	public int getRestTime() {
		return restTime;
	}

	public void setRestTime(int restTime) {
		this.restTime = restTime;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	//===================
	//검색조건 관련
	public String getSearchKeyword() {
		return searchKeyword;
	}
	
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	//파일업로드 관련
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
}

package com.bit.hellopt.service.exercise;

import java.util.List;

import com.bit.hellopt.vo.exercise.ExerciseInformationVO;

public interface ExerciseInformationService {
	//CRUD 기능 구현 메소드 정의
	void insertExerciseInformation(ExerciseInformationVO vo);
	void updateExerciseInformation(ExerciseInformationVO vo);
	void deleteExerciseInformation(ExerciseInformationVO vo);
	ExerciseInformationVO getExerciseInformation(ExerciseInformationVO vo);
	List<ExerciseInformationVO> getExerciseInformationList();
	List<ExerciseInformationVO> getExerciseInformationList(ExerciseInformationVO vo);
}
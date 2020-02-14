package com.bit.hellopt.data.exercise;

import java.util.List;

import com.bit.hellopt.vo.exercise.ExerciseInformationVO;

public interface ExerciseMapper {
	public List<ExerciseInformationVO> getExerciseInformationList(ExerciseInformationVO vo);
	public List<ExerciseInformationVO> getExerciseInformationList();
	public ExerciseInformationVO getExerciseInformation(ExerciseInformationVO vo);
	public ExerciseInformationVO insertExerciseInformation(ExerciseInformationVO vo);
	public void updateExerciseInformation(ExerciseInformationVO vo);
	public void deleteExerciseInformation(ExerciseInformationVO vo);
}

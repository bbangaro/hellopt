package com.bit.hellopt.data.exercise;

import java.util.List;

import com.bit.hellopt.vo.exercise.ExerciseInformationPaging;
import com.bit.hellopt.vo.exercise.ExerciseInformationVO;

public interface ExerciseMapper {//이놈아가 DAO다.
	public List<ExerciseInformationVO> getExerciseInformationList(ExerciseInformationVO vo);
	public List<ExerciseInformationVO> getExerciseInformationList();
	public ExerciseInformationVO getExerciseInformation(ExerciseInformationVO vo);
	public void insertExerciseInformation(ExerciseInformationVO vo);
	public void updateExerciseInformation(ExerciseInformationVO vo);
	public void deleteExerciseInformation(ExerciseInformationVO vo);
	public void getExerciseTotalCount(ExerciseInformationPaging vo);
	public void getExerciseCountlist(ExerciseInformationPaging vo);
}

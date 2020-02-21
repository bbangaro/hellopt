package com.bit.hellopt.service.exercise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.exercise.ExerciseMapper;
import com.bit.hellopt.vo.exercise.ExerciseInformationVO;


//@Service : @Component 상속받아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("exerciseInformationService")
public class ExerciseInformationServiceImpl implements ExerciseInformationService {
	
	@Autowired
	ExerciseMapper mapper;
	
	public ExerciseInformationServiceImpl() {
		System.out.println(">> ExerciseInformationServiceImpl() 실행");
	}
	@Override
	public void insertExerciseInformation(ExerciseInformationVO vo) {
		mapper.insertExerciseInformation(vo);
	}

	@Override
	public void updateExerciseInformation(ExerciseInformationVO vo) {
		mapper.updateExerciseInformation(vo);
	}

	@Override
	public void deleteExerciseInformation(ExerciseInformationVO vo) {
		mapper.deleteExerciseInformation(vo);
	}

	@Override
	public ExerciseInformationVO getExerciseInformation(ExerciseInformationVO vo) {
		return mapper.getExerciseInformation(vo);
	}

	@Override
	public List<ExerciseInformationVO> getExerciseInformationList() {
		return mapper.getExerciseInformationList();
	}

	@Override
	public List<ExerciseInformationVO> getExerciseInformationList(ExerciseInformationVO vo) {
		return mapper.getExerciseInformationList(vo);
	}
	
}

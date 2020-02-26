package com.bit.hellopt.service.trainer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.TrainerMapper;
import com.bit.hellopt.vo.trainer.TrainerVO;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	TrainerMapper trainerMapper;
	
	@Override
	public void insertTrainer(TrainerVO trainerVO) {
		trainerMapper.insertTrainer(trainerVO);
	}
	
	@Override
	public List<TrainerVO> getTrainer() {
		return trainerMapper.getTrainer();
	}
	
	@Override
	public TrainerVO getTrainerDetail(int trainerIdx) {
		return trainerMapper.getTrainerDetail(trainerIdx);
	}
	
	@Override
	public void deleteTrainer(int trainerIdx) {
		trainerMapper.deleteTrainer(trainerIdx);
	}
	
	@Override
	public void updateTrainer(int trainerIdx) {
		trainerMapper.updateTrainer(trainerIdx);
	}
}





package com.bit.hellopt.service.reviewboard;

import java.util.List;

import com.bit.hellopt.vo.reviewboard.ReviewBoardVO;


public interface RBoardService {
	
	void insertBoard(ReviewBoardVO vo);
	void updateBoard(ReviewBoardVO vo);
	void deleteBoard(ReviewBoardVO vo);
	List<ReviewBoardVO> getRBoardList();
	List<ReviewBoardVO> selectUser();
}

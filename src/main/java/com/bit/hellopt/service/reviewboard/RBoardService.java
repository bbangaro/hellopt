package com.bit.hellopt.service.reviewboard;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.hellopt.vo.User;
import com.bit.hellopt.vo.reviewboard.ReviewBoardVO;


public interface RBoardService {
	
	void insertBoard(ReviewBoardVO vo);
	void insertRBoardUploadFile(ReviewBoardVO vo, MultipartHttpServletRequest mpRequest);
	void updateBoard(ReviewBoardVO vo);
	void deleteBoard(ReviewBoardVO vo);
	List<ReviewBoardVO> getRBoardList();
	List<ReviewBoardVO> selectUser(User vo);
}

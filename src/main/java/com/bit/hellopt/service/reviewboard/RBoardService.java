package com.bit.hellopt.service.reviewboard;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.hellopt.vo.User;
import com.bit.hellopt.vo.reviewboard.RBoardVO;


public interface RBoardService {
	
	void insertBoard(RBoardVO vo);
	void insertRBoardUploadFile(RBoardVO vo, MultipartHttpServletRequest mpRequest);
	void updateBoard(RBoardVO vo);
	void deleteBoard(RBoardVO vo);
	List<RBoardVO> getRBoardList();
	List<RBoardVO> selectUser(User vo);
}

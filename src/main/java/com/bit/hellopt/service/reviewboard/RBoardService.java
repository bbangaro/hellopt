package com.bit.hellopt.service.reviewboard;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.hellopt.vo.User;
import com.bit.hellopt.vo.reviewboard.RBoardVO;
import com.bit.hellopt.vo.reviewboard.RFileVO;


public interface RBoardService {

	void insertBoard(RBoardVO vo);
	void updateBoard(RBoardVO vo);
	void deleteBoard(RBoardVO vo);
	List<RBoardVO> getRBoardList();
	List<RBoardVO> selectUser(User vo);
	List<RBoardVO> selectFile(RFileVO fvo);
	void uploadFile(String revFileOname, String saveFileName, long fileSize, int revIdx);
	List<RFileVO> getFileList(int revIdx);
	List<User> selectUserId(String userId);
	User selectUser();

}

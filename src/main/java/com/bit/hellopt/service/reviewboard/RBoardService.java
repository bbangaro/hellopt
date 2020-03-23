package com.bit.hellopt.service.reviewboard;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.hellopt.vo.reviewboard.PagingVO;
import com.bit.hellopt.vo.reviewboard.RBoardVO;
import com.bit.hellopt.vo.reviewboard.RFileVO;
import com.bit.hellopt.vo.user.User;


public interface RBoardService {
	
	void insertBoard(RBoardVO vo);
	void updateBoard(RBoardVO vo);
	void deleteBoard(RBoardVO vo);
	void uploadFile(String revFileOname, String saveFileName, long fileSize, int revIdx);
	List<RBoardVO> getRBoardList();
	List<RBoardVO> Join2();
	List<RFileVO> getFileList(int revIdx);
	List<User> selectUserId(String userId);
	User selectUser();
	List<RBoardVO> getProfilePic();
	
	//게시뭄 총 갯수
	int countBoard(RBoardVO vo);
	
	//페이징 처리 게시글 조회
	public List<RBoardVO> selectRBord(PagingVO pvo);
}

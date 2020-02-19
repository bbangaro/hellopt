package com.bit.hellopt.service.reviewboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.hellopt.data.RBoardMapper1;
import com.bit.hellopt.data.RBoardMapper2;
import com.bit.hellopt.vo.User;
import com.bit.hellopt.vo.reviewboard.RBoardVO;


@Service
public class RBoardServiceImpl implements RBoardService {
	
	@Autowired
	RBoardMapper1 mapper;
	RBoardMapper2 mapper2;
	
	
	
	@Override
	public void insertBoard(RBoardVO vo) {
		mapper.insertRBoard(vo);
	}
	@Override
	public void insertRBoardUploadFile(RBoardVO vo, MultipartHttpServletRequest mpRequest) {
		mapper.insertRBoardUploadFile(vo);
		
	}

	@Override
	public void updateBoard(RBoardVO vo) {
		mapper.updateRBoard(vo);
		
	}

	@Override
	public void deleteBoard(RBoardVO vo) {
		mapper.deleteRBoard(vo);
		
	}

	@Override
	public List<RBoardVO> getRBoardList() {
		return mapper.getRBoardList();
	}

	@Override
	public List<RBoardVO> selectUser(User vo) {
		return mapper2.join(vo);
		
	}


}

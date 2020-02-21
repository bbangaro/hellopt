package com.bit.hellopt.data;

import java.util.List;

import com.bit.hellopt.vo.User;
import com.bit.hellopt.vo.reviewboard.RBoardVO;
import com.bit.hellopt.vo.reviewboard.RFileVO;

public interface RBoardMapper2 {
	public List<RBoardVO> join1(User vo);
	public List<RBoardVO> join2(RFileVO fvo);
}

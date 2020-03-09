package com.bit.hellopt.data;

import java.util.List;

import com.bit.hellopt.vo.reviewboard.RBoardVO;
import com.bit.hellopt.vo.reviewboard.RFileVO;
import com.bit.hellopt.vo.user.User;

//조인용 매퍼
public interface RBoardMapper2 {
	public List<RBoardVO> join1(User vo);
	public List<RBoardVO> join2(RFileVO fvo);
}

package com.bit.hellopt.data;

import java.util.List;

import com.bit.hellopt.vo.User;
import com.bit.hellopt.vo.reviewboard.RBoardVO;

public interface RBoardMapper2 {
	public List<RBoardVO> join(User vo);
}

package com.bit.hellopt.data;

import java.util.List;

import com.bit.hellopt.vo.User;
import com.bit.hellopt.vo.reviewboard.ReviewBoardVO;

public interface RBoardMapper2 {
	public List<ReviewBoardVO> join(User vo);
}

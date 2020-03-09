package com.bit.hellopt.service.reviewboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.RCommentMapper;
import com.bit.hellopt.vo.reviewboard.RCommentVO;

@Service
public class RCommentServiceImple implements RCommentService {

	@Autowired
	RCommentMapper cmtMapper;
	
	//댓글목록
	@Override
	public List<RCommentVO> list(int revIdx) {
		return cmtMapper.list(revIdx);
	}
	//댓글작성
	@Override
	public void create(RCommentVO vo) {
		cmtMapper.create(vo);
	}
	//댓글수정
	@Override
	public void update(RCommentVO vo) {
		cmtMapper.update(vo);
		
	}
	//댓글삭제
	@Override
	public void delete(int revCmtIdx) {
		cmtMapper.delete(revCmtIdx);
		
	}

}

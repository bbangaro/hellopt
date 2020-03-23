package com.bit.hellopt.controller.reviewboard;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.hellopt.service.reviewboard.RBoardService;
import com.bit.hellopt.service.reviewboard.RCommentService;
import com.bit.hellopt.service.user.UserProfileService;
import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.reviewboard.RBoardVO;
import com.bit.hellopt.vo.reviewboard.RCommentVO;
import com.bit.hellopt.vo.reviewboard.RFileVO;
import com.bit.hellopt.vo.user.CustomUserDetail;
import com.bit.hellopt.vo.user.ProfileVO;
import com.bit.hellopt.vo.user.User;

@RestController
@SessionAttributes("rReply")
public class RBoardCommentController {
	@Autowired
	RCommentService rCmtService;
	@Autowired
	ServletContext servletContext;
	
	public RBoardCommentController(RCommentService rCmtService) {
		this.rCmtService = rCmtService;
	}
	
	//댓글 입력
	@RequestMapping("/review/reply/insert")
	public void insert(@ModelAttribute RCommentVO vo, Model model,  
			@AuthenticationPrincipal CustomUserDetail customUser) {
		String userId = customUser.getUsername();
		vo.setUserId(userId);
		rCmtService.create(vo);
	}
	//댓글 목록(@Controller방식 : view(화면)를 리턴)
	@PostMapping("/review/reply")
	public ModelAndView list(@RequestParam int revIdx, ModelAndView mav, 
			@AuthenticationPrincipal CustomUserDetail customUser) {
		List<RCommentVO> replyList = rCmtService.list(revIdx);
		//뷰이름 지정
		mav.setViewName("rboard/replylist");
		//뷰에 전달할 데이터 지정
		mav.addObject("replyList", replyList);
		//rboardcomment.jsp로 포워딩
		return mav;
	}
	//댓글 목록(@RestController Json 방식으로 처리 : 데이터를 리턴)
	@RequestMapping("/review/reviewjson")
	@ResponseBody //리턴데이터를 json으로 변환(생략가능)
	public List<RCommentVO> listJson(@RequestParam int revIdx){
		List<RCommentVO> list = rCmtService.list(revIdx);
		return list;
	}
	
}

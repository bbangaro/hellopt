package com.bit.hellopt.controller.reviewboard;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.bit.hellopt.service.reviewboard.RBoardService;
import com.bit.hellopt.vo.reviewboard.ReviewBoardVO;

@Controller
@SessionAttributes("rBoard")
public class rBoardController {
	@Autowired
	RBoardService rService;

	public rBoardController(RBoardService rService) {
		this.rService = rService;
	}
	
	
	@GetMapping("/reviewBoard")
	public String getRBoardList(ReviewBoardVO vo, Model model) {
		System.out.println(">>글 전체 목록 조회 처리 -getRBoardList()");
		
		
		List<ReviewBoardVO> rBoardList = rService.getRBoardList();
		System.out.println("rBoardList" + rBoardList.toString());
		
		model.addAttribute("rBoardList", rBoardList);
		return "reviewBoard";
	}
	
	@GetMapping("/insertRBoard")
	public String insertRBoard(ReviewBoardVO vo) throws IllegalStateException, IOException {
					
		System.out.println(">>> 글 등록 처리 - insertBoard()");
		
		/*MultipartFile uploadFile = vo.getRevFile();
		System.out.println("uploadFile: " + uploadFile);
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("c:/MyStuyd/temp/" + fileName));
		}*/
		
		rService.insertBoard(vo);
		
		return "redirect:/reviewBoard";
		
	}
	
}

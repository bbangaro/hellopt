package com.bit.hellopt.controller.reviewboard;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	@RequestMapping("/reviewBoard")
	public String getRBoardList(ReviewBoardVO vo, Model model) {
		System.out.println(">>글 전체 목록 조회 처리 -getRBoardList()");
		
		
		List<ReviewBoardVO> rBoardList = rService.getRBoardList();
		System.out.println("rBoardList" + rBoardList.toString());
		
		model.addAttribute("rBoardList", rBoardList);
		return "reviewBoard";
	}
	
	@PostMapping("/insertRBoard")
	public String insertRBoard(ReviewBoardVO vo) throws IllegalStateException, IOException {
					
		System.out.println(">>> 글 등록 처리 - insertBoard()");
		
		/* *** 파일 업로드 처리 ********
		 * MultipartFile 인터페이스 주요 메소드 
		 * String getOriginalFilename() : 업로드한 파일명 찾기
		 * void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		 * boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)
		 */
		MultipartFile uploadFile = vo.getFileupload();
		System.out.println("uploadFile: " + uploadFile);
		
		if(!uploadFile.isEmpty()) {
			String originFileName = uploadFile.getOriginalFilename();
			String originFileExtension = originFileName.substring(originFileName.lastIndexOf("."));
			vo.setRevFileOrigin(originFileName);
			String saveFileName = UUID.randomUUID().toString().replaceAll("-","") + originFileExtension;
			vo.setRevFileSave(saveFileName);
			uploadFile.transferTo(new File("c:/mystudy/temp/" + originFileName));
			
			System.out.println(originFileName + "은 업로드한 파일이다.");
			System.out.println(saveFileName + "라는 이름으로 업로드 됐다.");
			
			rService.insertRBoardUploadFile(vo);
		}else {
			rService.insertBoard(vo);
			
		}
		
		
		
		
		return "redirect:/reviewBoard";
		
	}
	
}

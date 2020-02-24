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

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.hellopt.service.reviewboard.RBoardService;
import com.bit.hellopt.vo.reviewboard.RBoardVO;
import com.bit.hellopt.vo.reviewboard.RFileVO;

@Controller
@SessionAttributes("rBoard")
public class RBoardController {
	@Autowired
	RBoardService rService;
	@Autowired
	ServletContext servletContext;
	
	public RBoardController(RBoardService rService) {
		this.rService = rService;
	}
	
	
	@RequestMapping("/reviewBoard")
	public String getRBoardList(RBoardVO vo, Model model) {
		System.out.println(">>글 전체 목록 조회 처리 -getRBoardList()");
		
		
		List<RBoardVO> rBoardList = rService.getRBoardList();
		
		for(RBoardVO rVO :rBoardList) {
			rVO.setFileList(rService.getFileList(rVO.getRevIdx()));
			
		}
		System.out.println(rBoardList);

		System.out.println("rBoardList: " + rBoardList.toString());
		model.addAttribute("rBoardList", rBoardList);
		return "reviewBoard";
	}
	
	@PostMapping("/insertRBoard")
	public String insertRBoard(RBoardVO vo, MultipartHttpServletRequest multi) 
					throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertBoard()");
		System.out.println("글 vo " +vo);
		rService.insertBoard(vo);
		
		String path = "C:/hellopt_file/";
	
		
		int revIdx = vo.getRevIdx();
		System.out.println("revIdx: " + revIdx);
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> fileList = multi.getFiles("file_0");
		if(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals("")) {
		
		}else {//for (MultipartFile filePart : fileList)
			for (int i = 0; i < fileList.size(); i++) {
				//원본파일명
				String revFileOname = fileList.get(i).getOriginalFilename();
				String FileExtension 
						= revFileOname.substring(revFileOname.lastIndexOf("."));
				//파일명  중복되지 않게 처리 한 저장될 이름
				String saveFileName 
						= UUID.randomUUID().toString().replaceAll("-","")+FileExtension; 
				String savePath = path + saveFileName; //저장될 파일 경로
				System.out.println("실제 파일 이름 : " + revFileOname);
				System.out.println("저장된 파일 이름 : " + saveFileName);
				long fileSize = fileList.get(i).getSize(); //파일사이즈
				System.out.println("저장된 파일 사이즈 : " + fileSize);
				fileList.get(i).transferTo(new File(savePath)); //파일 저장
				System.out.println("저장된 파일 경로" + savePath);
				
				System.out.println("revFileOname, saveFileName, fileSize: "+ revFileOname+ saveFileName + fileSize + revIdx);
				
				rService.uploadFile(revFileOname, saveFileName, fileSize, revIdx);
				
				System.out.println("글정보" + vo);

			}
		}
		return "redirect:/reviewBoard";
		/* *** 파일 업로드 처리 ********
		 * MultipartFile 인터페이스 주요 메소드 
		 * String getOriginalFilename() : 업로드한 파일명 찾기
		 * void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		 * boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)
		 */
		/*MultipartFile uploadFile = vo.getFile_0();
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
			
			rService.insertRBoardUploadFile(vo, mpRequest);
		}else {
			rService.insertBoard(vo);
			
		}*/

		
	}
//	@RequestMapping("/getPic")
//	public String getPic(RFileVO fvo, HttpServletRequest request, Model model) {
//		
//		List<RFileVO> getPicList = rService.getPic(fvo);
//
//		System.out.println("getPicList: " + getPicList.toString());
//		model.addAttribute("getPicList", getPicList);
//		/*List<RBoardVO> rBoardList = rService.getRBoardList();
//		System.out.println("rBoardList: " + rBoardList.toString());
//		model.addAttribute("rBoardList", rBoardList);
//		return "reviewBoard";*/
//		
//		return null;
//	}
	
	
	@PostMapping("/updateBoard")
	public String updateBoard(@ModelAttribute("board")RBoardVO vo) {
		System.out.println(">>> 글 수정 처리 - updateBoard()");
		System.out.println(">> board vo :" + vo);
		
		rService.updateBoard(vo);
		return "redirect:/reviewBoard";
	}
	@PostMapping("/deleteBoard")
	public String deleteBoard(RBoardVO vo) {
		System.out.println(">>> 글 삭제 처리 - deleteBoard()");
		
		rService.deleteBoard(vo);
		return "redirect:/reviewBoard";
	}
}

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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.hellopt.service.reviewboard.RBoardService;
import com.bit.hellopt.service.user.UserProfileService;
import com.bit.hellopt.service.user.UserService;
//import com.bit.hellopt.vo.reviewboard.Pagination;
import com.bit.hellopt.vo.reviewboard.PagingVO;
import com.bit.hellopt.vo.reviewboard.RBoardVO;
import com.bit.hellopt.vo.reviewboard.RFileVO;
import com.bit.hellopt.vo.reviewboard.RPagingVO;
import com.bit.hellopt.vo.user.CustomUserDetail;
import com.bit.hellopt.vo.user.ProfileVO;
import com.bit.hellopt.vo.user.User;

@Controller
@SessionAttributes("rBoard")
public class RBoardController {
	private static final RBoardVO RBoard = null;
	@Autowired
	RBoardService rService;
	@Autowired
	UserProfileService profileService;
	
	@Autowired
	ServletContext servletContext;
	
	public RBoardController(RBoardService rService) {
		this.rService = rService;
	}
	
	
	@RequestMapping("/review")
	public String getRBoardList(ModelMap modelMap, RBoardVO vo,RPagingVO rvo, Model model, User uvo, 
			@AuthenticationPrincipal CustomUserDetail customUser, 
			@RequestParam(defaultValue="1")Integer cPage) {
		System.out.println(">>글 전체 목록 조회 처리 -getRBoardList()");
;
		//paging///
		RPagingVO p = new RPagingVO();
		//1.전체 게시물의 수를 구하기
		p.setTotalRecord(rService.getTotalCount());
		p.setTotalPage();//전체 페이지 갯수 구하기
		
		System.out.println(">전체 게시글 수 : " + p.getTotalRecord());
		System.out.println(">전체 게시글 수 : " + p.getTotalPage());
		System.out.println("cPage" + cPage);
		
		if(cPage != null) {
			p.setNowPage(cPage);
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		System.out.println("---------------");
		System.out.println(">>현재 페이지 : " + p.getNowPage());
		System.out.println(">>시작번호(begin) : " + p.getBegin());
		System.out.println(">>끝 번호(end) : " + p.getEnd());
		
		//블록계산하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage -1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBegin(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() -1);
		
		if(p.getEndPage() > p.getTotalPage())
		
		
		List<RBoardVO> userjoin = rService.Join2();
		
		for(RBoardVO vo1 :userjoin) {
			vo1.setFilevo(rService.getFileList(vo1.getRevIdx()));
		}
		System.out.println("rBoardList: " + userjoin.toString());
//		System.out.println("userjoin: " + userjoin.toString());

		model.addAttribute("rBoardList", userjoin);
//		model.addAttribute("userjoin", userjoin);
		
		return "reviewBoard";
	}
	
	@PostMapping("/insertrboard")
	public String insertRBoard(RBoardVO vo, MultipartHttpServletRequest multi,
			@AuthenticationPrincipal CustomUserDetail customUser) 
					throws IllegalStateException, IOException {
		
		String userId = customUser.getUsername();
		String name = customUser.getName();
		vo.setUserId(userId);
		vo.setUserName(name);
		
		
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
		return "redirect:/review";
	}
	
	@PostMapping("/review/updateform")
	public String updateBoardForm(@ModelAttribute("rBoardList")RBoardVO vo) {
		System.out.println(">>> 글 수정 처리 - updateBoard()");
		System.out.println(">> board vo :" + vo);
		
		
		
		rService.updateBoard(vo);
		return "insertRBoard";
	}
	@PostMapping("/review/updateboard")
	public String updateBoard(@ModelAttribute("rBoardList")RBoardVO vo) {
		System.out.println(">>> 글 수정 처리 - updateBoard()");
		System.out.println(">> board vo :" + vo);
		
		rService.updateBoard(vo);
		return "redirect:/review";
	}
	@PostMapping("/review/deleteboard")
	public String deleteBoard(RBoardVO vo) {
		System.out.println(">>> 글 삭제 처리 - deleteBoard()");
		
		rService.deleteBoard(vo);
		return "redirect:/review";
	}
}

package com.bit.hellopt.controller.exercise;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.hellopt.service.exercise.ExerciseInformationService;
import com.bit.hellopt.vo.exercise.ExerciseInformationListVO;
import com.bit.hellopt.vo.exercise.ExerciseInformationVO;


@Controller
@SessionAttributes("exerciseinformation") //exerciseInformation 라는 이름의 Model이 있으면 session에 저장
public class ExerciseInformationController {
	@Autowired
	ExerciseInformationService exerciseInformationService;
	@Autowired
	ServletContext servletContext;
	
	public ExerciseInformationController(ExerciseInformationService exerciseInformationService) {
		this.exerciseInformationService = exerciseInformationService;
	}
	
	//메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	//@ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행됨
	//뷰에 전달될때 설정된 명칭(예: conditionMap)으로 전달
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		//key: 운동이름, value: EXERCISE_NAME
		//key: 운동부위, value: EXERCISE_PARTS
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("운동이름", "EXERCISE_NAME");
		conditionMap.put("운동부위", "EXERCISE_PARTS");
		
		return conditionMap;
	}

	//리턴타입 ModelAndView -> String 변경해서 리턴타입 통일
	//전달할 데이터 저장타입  ModelAndView -> Model
	@RequestMapping("/exerciseinfolist")
	public String getExerciseInformationList(ExerciseInformationVO vo, Model model) {
		System.out.println(">>> 글 전체 목록 조회 처리-getExerciseInformationList()");
		System.out.println("condition : " + vo.getSearchCondition());
		System.out.println("keyword : " + vo.getSearchKeyword());
		
		//null 체크 후 초기값 설정
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("EXERCISE_NAME");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		System.out.println("null처리후 condition : " + vo.getSearchCondition());
		System.out.println("null처리후 keyword : -" + vo.getSearchKeyword() + "-");
		
		List<ExerciseInformationVO> exerciseInformationList = exerciseInformationService.getExerciseInformationList(vo);
		
		for(ExerciseInformationVO evo : exerciseInformationList) {
			evo.setFilevo(exerciseInformationService.getFileList(evo.getExerciseIdx()));
		}
		
		System.out.println("exerciseInformationList: " + exerciseInformationList.toString());
		model.addAttribute("exerciseInformationList", exerciseInformationList);
		return "exercise/exerciseInfoList";
	}
	
	//리턴타입 ModleAndView -> String 변경 통일
	//전달할 데이타 저장타입 : ModleAndView -> Model
	@RequestMapping("exerciseinfo")
	public String getExerciseInformation(ExerciseInformationVO vo, Model model) {
		System.out.println(">>> 글 상세 조회 처리 - getExerciseInformation()");
		
		ExerciseInformationVO exerciseInformation = exerciseInformationService.getExerciseInformation(vo);
		//model.addAttribute(exerciseInformation); //exerciseInformationVO
		model.addAttribute("exerciseInformation", exerciseInformation); //데이터 저장
		System.out.println("> exerciseInformation : " + exerciseInformation);
		
		return "exercise/exerciseInfo";
	}
	
	@Value("${file.directory}")
	private String fileDirectory;
	
	@GetMapping("/exercise") //
	public String uploadForm() {
		return "exercise/insertexerciseinformation";
	}
	
	@GetMapping("/insertexerciseinformationform")
	public String form() {	
		return "exercise/insertexerciseinformationform";
	}
	
	@GetMapping("insertexerciseinformation")
	public String insertExerciseInformation(ExerciseInformationVO vo, Model model) throws IllegalStateException, IOException {
		
		return "redirect:/exerciseinfo";
	}
	
	
	@PostMapping("insertexerciseinformation")
	public String insertExerciseInformation(ExerciseInformationVO vo,/* @RequestParam("exercisePictures")*/ MultipartFile file, MultipartHttpServletRequest mtfRequest,
			Model model) throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertExerciseInformation()");
		System.out.println("글 vo " + vo);
		exerciseInformationService.insertExerciseInformation(vo);
		
		String path = "C:/hellopt_file/";
		
		int exerciseIdx = vo.getExerciseIdx();
		System.out.println("exerciseIdx: " + exerciseIdx);
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		List<MultipartFile> fileList = mtfRequest.getFiles("exercisePictures");
		if(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals("")) {
			
		} else {//for (MultipartFile filePart : fileList)
			for (int i = 0; i < fileList.size(); i++) {
				//원본파일명
				String exerciseInformationFileOname = fileList.get(i).getOriginalFilename();
				String FileExtension
						= exerciseInformationFileOname.substring(exerciseInformationFileOname.lastIndexOf("."));
				//파알명 중복되지 않게 처리 한 저장될 이름
				String saveFileName
						= UUID.randomUUID().toString().replaceAll("-", "")+FileExtension;
				String savePath = path + saveFileName; //저장된 파일 경로
				System.out.println("실제 파일 이름 : " + exerciseInformationFileOname);
				System.out.println("저장된 파일 이름 : " + saveFileName);
				long fileSize = fileList.get(i).getSize(); //파일 사이즈
				System.out.println("저장된 파일 사이즈 : " + fileSize);
				fileList.get(i).transferTo(new File(savePath)); //파일 저장
				System.out.println("저장된 파일 경로 : " + savePath);
				
				System.out.println("exerciseInformationFileOname, saveFileName, fileSize: " + exerciseInformationFileOname + saveFileName + fileSize + exerciseIdx);
				
				exerciseInformationService.uploadFile(exerciseInformationFileOname, saveFileName, fileSize, exerciseIdx);
				
				System.out.println("글정보" + vo);
				
			}
		}
		return "redirect:/exerciseinfolist";
	}
		/* *** 파일 업로드 처리 ********
		 * MultipartFile 인터페이스 주요 메소드
		 * String getOriginalFilename() : 업로드한 파일명 찾기
		 * void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		 * boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)
		 */
		
		
//		MultipartFile uploadFile = vo.getUploadFile();
//		System.out.println("uploadFile : " + uploadFile);
//		System.out.println("request : " + request.getParameter("exerciseName"));
//		
//		if (uploadFile == null) {
//			return "insertExerciseInformation";
//		}
//		
//		if (!uploadFile.isEmpty()) {//파일이 있으면(비어있지 않으면)
//			String fileName = uploadFile.getOriginalFilename();
//				uploadFile.transferTo(new File("c:/MyStudy/temp/" + fileName));
//		}
//		exerciseInformationService.insertExerciseInformation(vo);
//		return "getExerciseInformationList";
//			
		//여기 내용 수정할것~!~!!!!
		//일단 정보넣는것 먼저 하고 나서 파일 넣는 순서로 진행되어야함
	
	//@ModelAttribute("exerciseInformation") : Model에 exerciseInformation 라는 속성명의 객체 있으면 사용
	//    없으면 exerciseInformation라는 이름으로 새로 생성 
	@RequestMapping("/updateexerciseinfo")
	public String updateExerciseInformation(@ModelAttribute("exerciseInformation") ExerciseInformationVO vo) {
		System.out.println(">>> 글 수정 처리 - updateExerciseInformation()");
		System.out.println("> exerciseInformation vo : " + vo);
		
		exerciseInformationService.updateExerciseInformation(vo);
		return "exercise/exerciseInfoList";
	}
	
	@RequestMapping("/deleteexerciseinfo")
	public String deleteExerciseInformation(ExerciseInformationVO vo) {
		System.out.println(">>> 글 삭제 처리 - deleteExerciseInformation()"); 
		
		exerciseInformationService.deleteExerciseInformation(vo);
		return "exercise/exerciseInfoList";
	}
	
	//---------------------------------
	@RequestMapping("/dataTransform")
	@ResponseBody //응답객체의 몸체 담아서 전달
	public ExerciseInformationListVO dataTransform(ExerciseInformationVO vo) {
		System.out.println(">>> dataTransform() 실행(XML)");
		vo.setSearchCondition("EXERCISE_NAME");
		vo.setSearchKeyword("");
		
		List<ExerciseInformationVO> exerciseInformationList = exerciseInformationService.getExerciseInformationList(vo); //여기까진 맞음
		ExerciseInformationListVO exerciseInformationListVO = new ExerciseInformationListVO();
		exerciseInformationListVO.setExerciseInformationList(exerciseInformationList);
	
		return exerciseInformationListVO;
	}
	
	
}
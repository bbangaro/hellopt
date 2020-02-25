package com.bit.hellopt.controller.exercise;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@SessionAttributes("exerciseInformation") //exerciseInformation 라는 이름의 Model이 있으면 session에 저장
public class ExerciseInformationController {
	@Autowired
	private ExerciseInformationService exerciseInformationService;
	@Autowired
	private ServletContext servletContext;
	
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
	@RequestMapping("/exerciseInfoList")
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
		
		//List<ExerciseInformationVO> exerciseInformationList = exerciseInformationDAO.getExerciseInformationList();
		//List<ExerciseInformationVO> exerciseInformationList = exerciseInformationDAO.getExerciseInformationList(vo);
		List<ExerciseInformationVO> exerciseInformationList = exerciseInformationService.getExerciseInformationList(vo);
		model.addAttribute("exerciseInformationList", exerciseInformationList);
		
		return "exerciseInfoList";
	}
	
	//리턴타입 ModleAndView -> String 변경 통일
	//전달할 데이타 저장타입 : ModleAndView -> Model
	@RequestMapping("exerciseInfo")
	public String getExerciseInformation(ExerciseInformationVO vo, Model model) {
		System.out.println(">>> 글 상세 조회 처리 - getExerciseInformation()");
		
		ExerciseInformationVO exerciseInformation = exerciseInformationService.getExerciseInformation(vo);
		//model.addAttribute(exerciseInformation); //exerciseInformationVO
		model.addAttribute("exerciseInformation", exerciseInformation); //데이터 저장
		System.out.println("> exerciseInformation : " + exerciseInformation);
		
		return "exerciseInfo";
	}
	
	@Value("${file.directory}")
	private String fileDirectory;
	
	@GetMapping("/exercise") //내가 
	public String uploadForm() {
		return "insertExerciseInformation";
	}
	
	@GetMapping("insertExerciseInformationform")
	public String form() {
		return "insertExerciseInformationform";
	}
	
	@RequestMapping("insertExerciseInformation")
	public String insertExerciseInformation(ExerciseInformationVO vo, @RequestParam("exercisePictures") MultipartFile file, MultipartHttpServletRequest mtfRequest,
			Model model) throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertExerciseInformation()");
		
		List<MultipartFile> fileList = mtfRequest.getFiles("exercisePictures");
		
		//@RequestParam("file")이었었음
		
		/* *** 파일 업로드 처리 ********
		 * MultipartFile 인터페이스 주요 메소드
		 * String getOriginalFilename() : 업로드한 파일명 찾기
		 * void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		 * boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)
		 */
		String rootDirectory = mtfRequest.getSession().getServletContext().getRealPath("/");
		Path path = Paths.get(rootDirectory + fileDirectory + file.getOriginalFilename());
		String imageList = "";
		for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + originFileName;
			
			try {
				file.transferTo(new File(servletContext.getRealPath("/resources/images/") + file.getOriginalFilename())); //여기 바꿔봐
				//System.out.println("filepath" + servletContext.getRealPath("resources/images/") + file.getName() + file.getContentType());
				//file.transferTo(new File(rootDirectory + "/resources/images")); //여기 바꿔봐
			} catch (Exception e) {
				e.printStackTrace();
				//throw new RuntimeException("File saving failed", e);
			}
			System.out.println("파일업로드테스트 : " + file.getOriginalFilename());
			model.addAttribute("filename", file.getOriginalFilename());
			imageList += file.getOriginalFilename() + ",";
			}
		vo.setExercisePicturesName(imageList);
		exerciseInformationService.insertExerciseInformation(vo);
		return "redirect:/exerciseInfoList";
			
		}
		
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
	@RequestMapping("/updateExerciseInfo")
	public String updateExerciseInformation(@ModelAttribute("exerciseInformation") ExerciseInformationVO vo) {
		System.out.println(">>> 글 수정 처리 - updateExerciseInformation()");
		System.out.println("> exerciseInformation vo : " + vo);
		
		exerciseInformationService.updateExerciseInformation(vo);
		return "exerciseInfoList";
	}
	
	@RequestMapping("/deleteExerciseInfo")
	public String deleteExerciseInformation(ExerciseInformationVO vo) {
		System.out.println(">>> 글 삭제 처리 - deleteExerciseInformation()"); 
		
		exerciseInformationService.deleteExerciseInformation(vo);
		return "exerciseInfoList";
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
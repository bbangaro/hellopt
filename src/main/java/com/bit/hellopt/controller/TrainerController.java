package com.bit.hellopt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.hellopt.service.trainer.TrainerService;
import com.bit.hellopt.vo.trainer.TrainerVO;

@Controller
public class TrainerController {
	
	@Autowired
	TrainerService service;

	//트레이너 목록 가져오기
	@RequestMapping("/trainer")
	public String getTrainer(Model model) {
		List<TrainerVO> trainerList = service.getTrainerList();
		System.out.println("리스트 정보 가져오기 성공!");
		model.addAttribute("trainerList", trainerList);
		return "trainer/trainer";
	}
	
	//트레이너 상세정보 가져오기
	@RequestMapping("/trainerinfo")
	public String getTrainerDetail(int trainerIdx, Model model) {
		TrainerVO trainerinfo = service.getTrainerDetail(trainerIdx);
		System.out.println("트레이너 상세정보 가져오기 성공!");
		model.addAttribute("trainerinfo", trainerinfo);
		return "trainer/trainerinfo";
	}
	
	//관리자 페이지에서 입력, 수정, 삭제
	//트레이너 정보 입력
	@PostMapping("/inserttrainer")
	public String insertTrainer(TrainerVO info) {
		service.insertTrainer(info);
		System.out.println("트레이너 입력 성공!");
		return "redirect:/traineradmin";
	}
	
	@GetMapping("/trainerinsert")
	public String trainerinsert() {
		return "trainer/trainerinsert";
	}
	
	//트레이너 정보 삭제
	@RequestMapping("/deletetrainer")
	public String deleteTrainer(int trainerIdx) {
		service.deleteTrainer(trainerIdx);
		System.out.println("트레이너 삭제 성공!");
		return "redirect:/traineradmin";
	}
	
	//트레이너 정보 수정
	@RequestMapping("/trainerupdate")
	public String getTrainerUpdate(int trainerIdx, Model model) {
		TrainerVO trainerinfo = service.getTrainerDetail(trainerIdx);
		System.out.println("업데이트할 트레이너 상세정보 가져오기 성공!");
		model.addAttribute("trainerinfo", trainerinfo);
		return "trainer/trainerupdate";
	}
	
	@RequestMapping("/trainerupdatepage")
	public String getTrainerUpdate1(int trainerIdx, Model model) {
		TrainerVO trainerinfo = service.getTrainerDetail(trainerIdx);
		System.out.println("트레이너 수정페이지 불러오기 성공!");
		model.addAttribute("trainerinfo", trainerinfo);
		return "trainer/trainerupdatepage";
	}
	
	@PostMapping("/trainerupdatepage1")
	public String updateTrainer(TrainerVO trainerVO) {
		service.updateTrainer(trainerVO);
		System.out.println("트레이너정보수정성공!");
		return "redirect:/traineradmin";
	}
	
/*	@GetMapping("/trainerupdatepage")
	public String trainerupdatepage() {
		return "trainer/trainerupdatepage";
	}
	
	@PostMapping("/trainerupdatepage1")
	public String updateTrainer(TrainerVO trainerVO) {
		service.updateTrainer(trainerVO);
		System.out.println("트레이너정보수정성공!");
		return "redirect:/traineradmin";
	}*/
	
/*	@PostMapping("/updatetrainer")
	public String updateTrainer(TrainerVO trainerVO) {
		service.updateTrainer(trainerVO);
		System.out.println("트레이너정보수정성공!");
		return "redirect:/traineradmin";
	}*/
	
/*	@GetMapping("/trainerupdate")
	public String trainerupdate() {
		return "trainer/trainerupdate";
	}*/
	
	
	//관리자 페이지에서 트레이너 목록 수정,삭제 컨트롤 할 수 있는 화면
	@RequestMapping("/traineradmin")
	public String getAdminTrainer(Model model) {
		List<TrainerVO> trainerList = service.getTrainerList();
		System.out.println("관리자 트레이너 리스트 정보 가져오기 성공!");
		model.addAttribute("trainerList", trainerList);
		return "trainer/traineradmin";
	}
	
	
}

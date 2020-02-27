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
	
	@PostMapping("/inserttrainer" )
	public String insertTrainer(TrainerVO info) {
		service.insertTrainer(info);
		System.out.println("트레이너 입력 성공!");
		return "redirect:/trainer";
	}
	
	@GetMapping("/trainerinsert")
	public String trainerinsert() {
		return "trainer/trainerinsert";
	}
	
	@RequestMapping("/trainer")
	public String getTrainer(Model model) {
		List<TrainerVO> trainerList = service.getTrainerList();
		System.out.println("리스트 정보 가져오기 성공!");
		model.addAttribute("trainerList", trainerList);
		return "trainer/trainer";
	}
	
	@RequestMapping("/trainerinfo")
	public String getTrainerDetail(int trainerIdx, Model model) {
		TrainerVO trainerinfo = service.getTrainerDetail(trainerIdx);
		System.out.println("트레이너 상세정보 가져오기 성공!");
		model.addAttribute("trainerinfo", trainerinfo);
		return "trainer/trainerinfo";
	}
	
	@RequestMapping("/deletetrainer")
	public String deleteTrainer(int trainerIdx) {
		service.deleteTrainer(trainerIdx);
		System.out.println("트레이너 삭제 성공!");
		return "redirect:/trainer/trainer";
	}
	
	@RequestMapping("/updatetrainer")
	public String updateTrainer(int trainerIdx) {
		service.deleteTrainer(trainerIdx);
		System.out.println("트레이너 수정 성공!");
		return "redirect:/trainer/trainer";
	}
	
/*	@GetMapping("/trainer")
	public String trainer() {
		return "trainer/trainer";
	}
	
	@GetMapping("/trainerinfo")
	public String trainerinfo() {
		return "trainer/trainerinfo";
	}*/
	
}

package com.bit.hellopt.vo.exercise;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="exerciseInformationList")
@XmlAccessorType(XmlAccessType.FIELD)
public class ExerciseInformationListVO {

	@XmlElement(name="exerciseInformation")
	private List<ExerciseInformationVO> exerciseInformationList;
	
	public List<ExerciseInformationVO> getExerciseInformationList() {
		return exerciseInformationList;
	}
	
	public void setExerciseInformationList(List<ExerciseInformationVO> exerciseInformationList) {
		this.exerciseInformationList = exerciseInformationList;
	}
	
}

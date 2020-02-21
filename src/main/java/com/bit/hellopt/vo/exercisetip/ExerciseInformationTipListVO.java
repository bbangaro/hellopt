package com.bit.hellopt.vo.exercisetip;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="exerciseInformationTipList")
@XmlAccessorType(XmlAccessType.FIELD)
public class ExerciseInformationTipListVO {

	@XmlElement(name="exerciseInformationTip")
	private List<ExerciseInformationTipVO> exerciseInformationTipList;
	
	public List<ExerciseInformationTipVO> getExerciseInformationTipList() {
		return exerciseInformationTipList;
	}
	
	public void setExerciseInformationTipList(List<ExerciseInformationTipVO> exerciseInformationTipList) {
		this.exerciseInformationTipList = exerciseInformationTipList;
	}
	
}

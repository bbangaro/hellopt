package com.bit.hellopt.vo.trainer;

public class TrainerVO {
	private String trainerName, trainerNickname, trainerCareer, trainerTalk, trainerMedia, fkUserId;
	private int trainerIdx;
	
	public TrainerVO() {}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public String getTrainerNickname() {
		return trainerNickname;
	}

	public void setTrainerNickname(String trainerNickname) {
		this.trainerNickname = trainerNickname;
	}

	public String getTrainerCareer() {
		return trainerCareer;
	}

	public void setTrainerCareer(String trainerCareer) {
		this.trainerCareer = trainerCareer;
	}

	public String gettrainerTalk() {
		return trainerTalk;
	}

	public void settrainerTalk(String trainerTalk) {
		this.trainerTalk = trainerTalk;
	}

	public String getTrainerMedia() {
		return trainerMedia;
	}

	public void setTrainerMedia(String trainerMedia) {
		this.trainerMedia = trainerMedia;
	}

	public String getFkUserId() {
		return fkUserId;
	}

	public void setFkUserId(String fkUserId) {
		this.fkUserId = fkUserId;
	}

	public int getTrainerIdx() {
		return trainerIdx;
	}

	public void setTrainerIdx(int trainerIdx) {
		this.trainerIdx = trainerIdx;
	}

	@Override
	public String toString() {
		return "TrainerVO [trainerName=" + trainerName + ", trainerNickname=" + trainerNickname + ", trainerCareer="
				+ trainerCareer + ", trainerTalk=" + trainerTalk + ", trainerMedia=" + trainerMedia + ", fkUserId="
				+ fkUserId + ", trainerIdx=" + trainerIdx + "]";
	}
}

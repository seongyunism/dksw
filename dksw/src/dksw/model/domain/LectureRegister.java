package dksw.model.domain;

public class LectureRegister {

	private int dkswLectureNo;
	private int dkswMemberNo;
	
	public int getDkswLectureNo() {
		return dkswLectureNo;
	}
	public void setDkswLectureNo(int dkswLectureNo) {
		this.dkswLectureNo = dkswLectureNo;
	}
	public int getDkswMemberNo() {
		return dkswMemberNo;
	}
	public void setDkswMemberNo(int dkswMemberNo) {
		this.dkswMemberNo = dkswMemberNo;
	}
	
	public LectureRegister(int dkswLectureNo, int dkswMemberNo) {
		super();
		this.dkswLectureNo = dkswLectureNo;
		this.dkswMemberNo = dkswMemberNo;
	}
}
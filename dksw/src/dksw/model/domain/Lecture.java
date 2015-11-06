package dksw.model.domain;

public class Lecture {

	private int dkswLectureNo;
	private int dkswLectureYear;
	private int dkswLectureSemester;
	private String dkswLectureName;
	private int dkswDepartmentProfessorNo;
	
	public int getDkswLectureNo() {
		return dkswLectureNo;
	}
	public void setDkswLectureNo(int dkswLectureNo) {
		this.dkswLectureNo = dkswLectureNo;
	}
	public int getDkswLectureYear() {
		return dkswLectureYear;
	}
	public void setDkswLectureYear(int dkswLectureYear) {
		this.dkswLectureYear = dkswLectureYear;
	}
	public int getDkswLectureSemester() {
		return dkswLectureSemester;
	}
	public void setDkswLectureSemester(int dkswLectureSemester) {
		this.dkswLectureSemester = dkswLectureSemester;
	}
	public String getDkswLectureName() {
		return dkswLectureName;
	}
	public void setDkswLectureName(String dkswLectureName) {
		this.dkswLectureName = dkswLectureName;
	}
	public int getDkswDepartmentProfessorNo() {
		return dkswDepartmentProfessorNo;
	}
	public void setDkswDepartmentProfessorNo(int dkswDepartmentProfessorNo) {
		this.dkswDepartmentProfessorNo = dkswDepartmentProfessorNo;
	}
	
	public Lecture(int dkswLectureNo, int dkswLectureYear, int dkswLectureSemester, String dkswLectureName, int dkswDepartmentProfessorNo) {
		super();
		this.dkswLectureNo = dkswLectureNo;
		this.dkswLectureYear = dkswLectureYear;
		this.dkswLectureSemester = dkswLectureSemester;
		this.dkswLectureName = dkswLectureName;
		this.dkswDepartmentProfessorNo = dkswDepartmentProfessorNo;
	}
}
package dksw.model.domain;

public class LectureChapter {

	private int dkswLectureChapterNo; // 인덱스
	private int dkswLectureNo;
	private int dkswDepartmentProfessorNo;
	private int dkswLectureChapterCount; // 챕터번호
	private String dkswLectureChapterName; // 강의명
	private int dkswLectureChapterVisible;
	private int dkswLectureChapterDownloadCount;
	private int dkswLectureChapterDate;
	
	public int getDkswLectureChapterNo() {
		return dkswLectureChapterNo;
	}
	public void setDkswLectureChapterNo(int dkswLectureChapterNo) {
		this.dkswLectureChapterNo = dkswLectureChapterNo;
	}
	public int getDkswLectureNo() {
		return dkswLectureNo;
	}
	public void setDkswLectureNo(int dkswLectureNo) {
		this.dkswLectureNo = dkswLectureNo;
	}
	public int getDkswDepartmentProfessorNo() {
		return dkswDepartmentProfessorNo;
	}
	public void setDkswDepartmentProfessorNo(int dkswDepartmentProfessorNo) {
		this.dkswDepartmentProfessorNo = dkswDepartmentProfessorNo;
	}
	public int getDkswLectureChapterCount() {
		return dkswLectureChapterCount;
	}
	public void setDkswLectureChapterCount(int dkswLectureChapterCount) {
		this.dkswLectureChapterCount = dkswLectureChapterCount;
	}
	public String getDkswLectureChapterName() {
		return dkswLectureChapterName;
	}
	public void setDkswLectureChapterName(String dkswLectureChapterName) {
		this.dkswLectureChapterName = dkswLectureChapterName;
	}
	public int getDkswLectureChapterVisible() {
		return dkswLectureChapterVisible;
	}
	public void setDkswLectureChapterVisible(int dkswLectureChapterVisible) {
		this.dkswLectureChapterVisible = dkswLectureChapterVisible;
	}
	public int getDkswLectureChapterDownloadCount() {
		return dkswLectureChapterDownloadCount;
	}
	public void setDkswLectureChapterDownloadCount(int dkswLectureChapterDownloadCount) {
		this.dkswLectureChapterDownloadCount = dkswLectureChapterDownloadCount;
	}
	public int getDkswLectureChapterDate() {
		return dkswLectureChapterDate;
	}
	public void setDkswLectureChapterDate(int dkswLectureChapterDate) {
		this.dkswLectureChapterDate = dkswLectureChapterDate;
	}
	
	public LectureChapter(int dkswLectureChapterNo, int dkswLectureNo, int dkswDepartmentProfessorNo,
			int dkswLectureChapterCount, String dkswLectureChapterName, int dkswLectureChapterVisible,
			int dkswLectureChapterDownloadCount, int dkswLectureChapterDate) {
		super();
		this.dkswLectureChapterNo = dkswLectureChapterNo;
		this.dkswLectureNo = dkswLectureNo;
		this.dkswDepartmentProfessorNo = dkswDepartmentProfessorNo;
		this.dkswLectureChapterCount = dkswLectureChapterCount;
		this.dkswLectureChapterName = dkswLectureChapterName;
		this.dkswLectureChapterVisible = dkswLectureChapterVisible;
		this.dkswLectureChapterDownloadCount = dkswLectureChapterDownloadCount;
		this.dkswLectureChapterDate = dkswLectureChapterDate;
	}
}
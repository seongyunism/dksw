package dksw.model.domain;

public class DepartmentHistory {

	private int dkswDepartmentHistoryNo;
	private int dkswDepartmentHistoryYear;
	private int dkswDepartmentHistoryMonth;
	private String dkswDepartmentHistoryContent;
	private int dkswDepartmentHistoryVisible;
	
	public int getDkswDepartmentHistoryNo() {
		return dkswDepartmentHistoryNo;
	}
	public void setDkswDepartmentHistoryNo(int dkswDepartmentHistoryNo) {
		this.dkswDepartmentHistoryNo = dkswDepartmentHistoryNo;
	}
	public int getDkswDepartmentHistoryYear() {
		return dkswDepartmentHistoryYear;
	}
	public void setDkswDepartmentHistoryYear(int dkswDepartmentHistoryYear) {
		this.dkswDepartmentHistoryYear = dkswDepartmentHistoryYear;
	}
	public int getDkswDepartmentHistoryMonth() {
		return dkswDepartmentHistoryMonth;
	}
	public void setDkswDepartmentHistoryMonth(int dkswDepartmentHistoryMonth) {
		this.dkswDepartmentHistoryMonth = dkswDepartmentHistoryMonth;
	}
	public String getDkswDepartmentHistoryContent() {
		return dkswDepartmentHistoryContent;
	}
	public void setDkswDepartmentHistoryContent(String dkswDepartmentHistoryContent) {
		this.dkswDepartmentHistoryContent = dkswDepartmentHistoryContent;
	}
	public int getDkswDepartmentHistoryVisible() {
		return dkswDepartmentHistoryVisible;
	}
	public void setDkswDepartmentHistoryVisible(int dkswDepartmentHistoryVisible) {
		this.dkswDepartmentHistoryVisible = dkswDepartmentHistoryVisible;
	}
	
	public DepartmentHistory(int dkswDepartmentHistoryNo, int dkswDepartmentHistoryYear, int dkswDepartmentHistoryMonth,
			String dkswDepartmentHistoryContent, int dkswDepartmentHistoryVisible) {
		super();
		this.dkswDepartmentHistoryNo = dkswDepartmentHistoryNo;
		this.dkswDepartmentHistoryYear = dkswDepartmentHistoryYear;
		this.dkswDepartmentHistoryMonth = dkswDepartmentHistoryMonth;
		this.dkswDepartmentHistoryContent = dkswDepartmentHistoryContent;
		this.dkswDepartmentHistoryVisible = dkswDepartmentHistoryVisible;
	}
	
	
}
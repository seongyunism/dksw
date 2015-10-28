package dksw.model.domain;

public class LabProject {
	private int dkswLabProjectNo;
	private int dkswLabCode;
	private String dkswLabProjectName;
	private String dkswLabProjectStartYear;
	private String dkswLabProjectStartMonth;
	private String dkswLabProjectEndYear;
	private String dkswLabProjectEndMonth;
	private String dkswLabProjectContent;
	private int dkswLabProjectEditDate; 
	private int dkswLabProjectEditRightIndex;
	
	public int getDkswLabProjectNo() {
		return dkswLabProjectNo;
	}
	public void setDkswLabProjectNo(int dkswLabProjectNo) {
		this.dkswLabProjectNo = dkswLabProjectNo;
	}
	public int getDkswLabCode() {
		return dkswLabCode;
	}
	public void setDkswLabCode(int dkswLabCode) {
		this.dkswLabCode = dkswLabCode;
	}
	public String getDkswLabProjectName() {
		return dkswLabProjectName;
	}
	public void setDkswLabProjectName(String dkswLabProjectName) {
		this.dkswLabProjectName = dkswLabProjectName;
	}
	public String getDkswLabProjectStartYear() {
		return dkswLabProjectStartYear;
	}
	public void setDkswLabProjectStartYear(String dkswLabProjectStartYear) {
		this.dkswLabProjectStartYear = dkswLabProjectStartYear;
	}
	public String getDkswLabProjectStartMonth() {
		return dkswLabProjectStartMonth;
	}
	public void setDkswLabProjectStartMonth(String dkswLabProjectStartMonth) {
		this.dkswLabProjectStartMonth = dkswLabProjectStartMonth;
	}
	public String getDkswLabProjectEndYear() {
		return dkswLabProjectEndYear;
	}
	public void setDkswLabProjectEndYear(String dkswLabProjectEndYear) {
		this.dkswLabProjectEndYear = dkswLabProjectEndYear;
	}
	public String getDkswLabProjectEndMonth() {
		return dkswLabProjectEndMonth;
	}
	public void setDkswLabProjectEndMonth(String dkswLabProjectEndMonth) {
		this.dkswLabProjectEndMonth = dkswLabProjectEndMonth;
	}
	public String getDkswLabProjectContent() {
		return dkswLabProjectContent;
	}
	public void setDkswLabProjectContent(String dkswLabProjectContent) {
		this.dkswLabProjectContent = dkswLabProjectContent;
	}
	public int getDkswLabProjectEditDate() {
		return dkswLabProjectEditDate;
	}
	public void setDkswLabProjectEditDate(int dkswLabProjectEditDate) {
		this.dkswLabProjectEditDate = dkswLabProjectEditDate;
	}
	public int getDkswLabProjectEditRightIndex() {
		return dkswLabProjectEditRightIndex;
	}
	public void setDkswLabProjectEditRightIndex(int dkswLabProjectEditRightIndex) {
		this.dkswLabProjectEditRightIndex = dkswLabProjectEditRightIndex;
	}
	
	public LabProject(int dkswLabProjectNo, int dkswLabCode, String dkswLabProjectName, String dkswLabProjectStartYear,
			String dkswLabProjectStartMonth, String dkswLabProjectEndYear, String dkswLabProjectEndMonth,
			String dkswLabProjectContent, int dkswLabProjectEditDate, int dkswLabProjectEditRightIndex) {
		super();
		this.dkswLabProjectNo = dkswLabProjectNo;
		this.dkswLabCode = dkswLabCode;
		this.dkswLabProjectName = dkswLabProjectName;
		this.dkswLabProjectStartYear = dkswLabProjectStartYear;
		this.dkswLabProjectStartMonth = dkswLabProjectStartMonth;
		this.dkswLabProjectEndYear = dkswLabProjectEndYear;
		this.dkswLabProjectEndMonth = dkswLabProjectEndMonth;
		this.dkswLabProjectContent = dkswLabProjectContent;
		this.dkswLabProjectEditDate = dkswLabProjectEditDate;
		this.dkswLabProjectEditRightIndex = dkswLabProjectEditRightIndex;
	}	
}

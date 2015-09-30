package dksw.model.domain;

public class LabAcheivements {
	
	private int dkswLabCode;
	private String dkswLabAcheivementsYear;
	private String dkswLabAcheivementsMonth;
	private String dkswLabAcheivementsContent;
	private int dkswLabAcheivementsEditDate;
	private int dkswLabAcheivementsEditRightIndex;
	
	public int getDkswLabCode() {
		return dkswLabCode;
	}
	public void setDkswLabCode(int dkswLabCode) {
		this.dkswLabCode = dkswLabCode;
	}
	public String getDkswLabAcheivementsYear() {
		return dkswLabAcheivementsYear;
	}
	public void setDkswLabAcheivementsYear(String dkswLabAcheivementsYear) {
		this.dkswLabAcheivementsYear = dkswLabAcheivementsYear;
	}
	public String getDkswLabAcheivementsMonth() {
		return dkswLabAcheivementsMonth;
	}
	public void setDkswLabAcheivementsMonth(String dkswLabAcheivementsMonth) {
		this.dkswLabAcheivementsMonth = dkswLabAcheivementsMonth;
	}
	public String getDkswLabAcheivementsContent() {
		return dkswLabAcheivementsContent;
	}
	public void setDkswLabAcheivementsContent(String dkswLabAcheivementsContent) {
		this.dkswLabAcheivementsContent = dkswLabAcheivementsContent;
	}
	public int getDkswLabAcheivementsEditDate() {
		return dkswLabAcheivementsEditDate;
	}
	public void setDkswLabAcheivementsEditDate(int dkswLabAcheivementsEditDate) {
		this.dkswLabAcheivementsEditDate = dkswLabAcheivementsEditDate;
	}
	public int getDkswLabAcheivementsEditRightIndex() {
		return dkswLabAcheivementsEditRightIndex;
	}
	public void setDkswLabAcheivementsEditRightIndex(int dkswLabAcheivementsEditRightIndex) {
		this.dkswLabAcheivementsEditRightIndex = dkswLabAcheivementsEditRightIndex;
	}
	
	public LabAcheivements(int dkswLabCode, String dkswLabAcheivementsYear, String dkswLabAcheivementsMonth,
			String dkswLabAcheivementsContent, int dkswLabAcheivementsEditDate, int dkswLabAcheivementsEditRightIndex) {
		super();
		this.dkswLabCode = dkswLabCode;
		this.dkswLabAcheivementsYear = dkswLabAcheivementsYear;
		this.dkswLabAcheivementsMonth = dkswLabAcheivementsMonth;
		this.dkswLabAcheivementsContent = dkswLabAcheivementsContent;
		this.dkswLabAcheivementsEditDate = dkswLabAcheivementsEditDate;
		this.dkswLabAcheivementsEditRightIndex = dkswLabAcheivementsEditRightIndex;
	}
}

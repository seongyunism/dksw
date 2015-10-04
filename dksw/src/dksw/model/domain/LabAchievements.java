package dksw.model.domain;

public class LabAchievements {
	
	private int dkswLabCode;
	private String dkswLabachievementsYear;
	private String dkswLabachievementsMonth;
	private String dkswLabachievementsContent;
	private int dkswLabachievementsEditDate;
	private int dkswLabachievementsEditRightIndex;
	
	public int getDkswLabCode() {
		return dkswLabCode;
	}
	public void setDkswLabCode(int dkswLabCode) {
		this.dkswLabCode = dkswLabCode;
	}
	public String getDkswLabachievementsYear() {
		return dkswLabachievementsYear;
	}
	public void setDkswLabachievementsYear(String dkswLabachievementsYear) {
		this.dkswLabachievementsYear = dkswLabachievementsYear;
	}
	public String getDkswLabachievementsMonth() {
		return dkswLabachievementsMonth;
	}
	public void setDkswLabachievementsMonth(String dkswLabachievementsMonth) {
		this.dkswLabachievementsMonth = dkswLabachievementsMonth;
	}
	public String getDkswLabachievementsContent() {
		return dkswLabachievementsContent;
	}
	public void setDkswLabachievementsContent(String dkswLabachievementsContent) {
		this.dkswLabachievementsContent = dkswLabachievementsContent;
	}
	public int getDkswLabachievementsEditDate() {
		return dkswLabachievementsEditDate;
	}
	public void setDkswLabachievementsEditDate(int dkswLabachievementsEditDate) {
		this.dkswLabachievementsEditDate = dkswLabachievementsEditDate;
	}
	public int getDkswLabachievementsEditRightIndex() {
		return dkswLabachievementsEditRightIndex;
	}
	public void setDkswLabachievementsEditRightIndex(int dkswLabachievementsEditRightIndex) {
		this.dkswLabachievementsEditRightIndex = dkswLabachievementsEditRightIndex;
	}
	
	public LabAchievements(int dkswLabCode, String dkswLabachievementsYear, String dkswLabachievementsMonth,
			String dkswLabachievementsContent, int dkswLabachievementsEditDate, int dkswLabachievementsEditRightIndex) {
		super();
		this.dkswLabCode = dkswLabCode;
		this.dkswLabachievementsYear = dkswLabachievementsYear;
		this.dkswLabachievementsMonth = dkswLabachievementsMonth;
		this.dkswLabachievementsContent = dkswLabachievementsContent;
		this.dkswLabachievementsEditDate = dkswLabachievementsEditDate;
		this.dkswLabachievementsEditRightIndex = dkswLabachievementsEditRightIndex;
	}
}

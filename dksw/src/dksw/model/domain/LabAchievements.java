package dksw.model.domain;

public class LabAchievements {
	
	private int dkswLabCode;
	private String dkswLabAchievementsYear;
	private String dkswLabAchievementsMonth;
	private String dkswLabAchievementsContent;
	private int dkswLabAchievementsEditDate;
	private int dkswLabAchievementsEditRightIndex;
	
	public int getDkswLabCode() {
		return dkswLabCode;
	}
	public void setDkswLabCode(int dkswLabCode) {
		this.dkswLabCode = dkswLabCode;
	}
	public String getDkswLabAchievementsYear() {
		return dkswLabAchievementsYear;
	}
	public void setDkswLabAchievementsYear(String dkswLabAchievementsYear) {
		this.dkswLabAchievementsYear = dkswLabAchievementsYear;
	}
	public String getDkswLabAchievementsMonth() {
		return dkswLabAchievementsMonth;
	}
	public void setDkswLabAchievementsMonth(String dkswLabAchievementsMonth) {
		this.dkswLabAchievementsMonth = dkswLabAchievementsMonth;
	}
	public String getDkswLabAchievementsContent() {
		return dkswLabAchievementsContent;
	}
	public void setDkswLabAchievementsContent(String dkswLabAchievementsContent) {
		this.dkswLabAchievementsContent = dkswLabAchievementsContent;
	}
	public int getDkswLabAchievementsEditDate() {
		return dkswLabAchievementsEditDate;
	}
	public void setDkswLabAchievementsEditDate(int dkswLabAchievementsEditDate) {
		this.dkswLabAchievementsEditDate = dkswLabAchievementsEditDate;
	}
	public int getDkswLabAchievementsEditRightIndex() {
		return dkswLabAchievementsEditRightIndex;
	}
	public void setDkswLabAchievementsEditRightIndex(int dkswLabAchievementsEditRightIndex) {
		this.dkswLabAchievementsEditRightIndex = dkswLabAchievementsEditRightIndex;
	}
	
	public LabAchievements(int dkswLabCode, String dkswLabAchievementsYear, String dkswLabAchievementsMonth,
			String dkswLabAchievementsContent, int dkswLabAchievementsEditDate, int dkswLabAchievementsEditRightIndex) {
		super();
		this.dkswLabCode = dkswLabCode;
		this.dkswLabAchievementsYear = dkswLabAchievementsYear;
		this.dkswLabAchievementsMonth = dkswLabAchievementsMonth;
		this.dkswLabAchievementsContent = dkswLabAchievementsContent;
		this.dkswLabAchievementsEditDate = dkswLabAchievementsEditDate;
		this.dkswLabAchievementsEditRightIndex = dkswLabAchievementsEditRightIndex;
	}
}
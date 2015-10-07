package dksw.model.domain;

public class DepartmentHistory {

	private int dkswDepartmentHistoryYear;
	private int dkswDepartmentHistoryMonth;
	private String dkswDepartmentHistoryContent;
	private int dkswDepartmentHistoryVisible;
	private int dkswDepartmentHistoryEditDate;
	private int dkswDepartmentHistoryPermission;

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

	public int getDkswDepartmentHistoryEditDate() {
		return dkswDepartmentHistoryEditDate;
	}

	public void setDkswDepartmentHistoryEditDate(int dkswDepartmentHistoryEditDate) {
		this.dkswDepartmentHistoryEditDate = dkswDepartmentHistoryEditDate;
	}

	public int getDkswDepartmentHistoryPermission() {
		return dkswDepartmentHistoryPermission;
	}

	public void setDkswDepartmentHistoryPermission(int dkswDepartmentHistoryPermission) {
		this.dkswDepartmentHistoryPermission = dkswDepartmentHistoryPermission;
	}

	public DepartmentHistory (int dkswDepartmentHistoryYear, int dkswDepartmentHistoryMonth, String dkswDepartmentHistoryContent,
			int dkswDepartmentHistoryVisible, int dkswDepartmentHistoryEditDate, int dkswDepartmentHistoryPermission)
	{
		super();
		
		this.dkswDepartmentHistoryYear = dkswDepartmentHistoryYear;
		this.dkswDepartmentHistoryMonth = dkswDepartmentHistoryMonth;
		this.dkswDepartmentHistoryContent = dkswDepartmentHistoryContent;
		this.dkswDepartmentHistoryVisible = dkswDepartmentHistoryVisible;
		this.dkswDepartmentHistoryEditDate = dkswDepartmentHistoryEditDate;
		this.dkswDepartmentHistoryPermission = dkswDepartmentHistoryPermission;
		
	}
	
}
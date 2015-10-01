package dksw.model.domain;

public class DepartmentGreeting {

	private String dkswDepartmentGreetingTitle;
	private String dkswDepartmentGreetingPicture;
	private String dkswDepartmentGreetingContent;
	private int dkswDepartmentGreetingEditDate;
	private int dkswDepartmentGreetingEditPermission;
	
	public String getDkswDepartmentGreetingTitle() {
		return dkswDepartmentGreetingTitle;
	}
	public void setDkswDepartmentGreetingTitle(String dkswDepartmentGreetingTitle) {
		this.dkswDepartmentGreetingTitle = dkswDepartmentGreetingTitle;
	}
	public String getDkswDepartmentGreetingPicture() {
		return dkswDepartmentGreetingPicture;
	}
	public void setDkswDepartmentGreetingPicture(String dkswDepartmentGreetingPicture) {
		this.dkswDepartmentGreetingPicture = dkswDepartmentGreetingPicture;
	}
	public String getDkswDepartmentGreetingContent() {
		return dkswDepartmentGreetingContent;
	}
	public void setDkswDepartmentGreetingContent(String dkswDepartmentGreetingContent) {
		this.dkswDepartmentGreetingContent = dkswDepartmentGreetingContent;
	}
	public int getDkswDepartmentGreetingEditDate() {
		return dkswDepartmentGreetingEditDate;
	}
	public void setDkswDepartmentGreetingEditDate(int dkswDepartmentGreetingEditDate) {
		this.dkswDepartmentGreetingEditDate = dkswDepartmentGreetingEditDate;
	}
	public int getDkswDepartmentGreetingEditPermission() {
		return dkswDepartmentGreetingEditPermission;
	}
	public void setDkswDepartmentGreetingEditPermission(int dkswDepartmentGreetingEditPermission) {
		this.dkswDepartmentGreetingEditPermission = dkswDepartmentGreetingEditPermission;
	}
	
	public DepartmentGreeting(String dkswDepartmentGreetingTitle, String dkswDepartmentGreetingPicture,
			String dkswDepartmentGreetingContent, int dkswDepartmentGreetingEditDate,
			int dkswDepartmentGreetingEditPermission) {
		super();
		this.dkswDepartmentGreetingTitle = dkswDepartmentGreetingTitle;
		this.dkswDepartmentGreetingPicture = dkswDepartmentGreetingPicture;
		this.dkswDepartmentGreetingContent = dkswDepartmentGreetingContent;
		this.dkswDepartmentGreetingEditDate = dkswDepartmentGreetingEditDate;
		this.dkswDepartmentGreetingEditPermission = dkswDepartmentGreetingEditPermission;
	}
}
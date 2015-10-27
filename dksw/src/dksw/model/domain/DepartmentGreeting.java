package dksw.model.domain;

public class DepartmentGreeting {

	private String dkswDepartmentGreetingTitle;
	private String dkswDepartmentGreetingPicture;
	private String dkswDepartmentGreetingContent;
	private int dkswDepartmentGreetingEditDate;
	private int dkswMemberNo;
	
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
	public int getDkswMemberNo() {
		return dkswMemberNo;
	}
	public void setDkswMemberNo(int dkswMemberNo) {
		this.dkswMemberNo = dkswMemberNo;
	}
	
	public DepartmentGreeting(String dkswDepartmentGreetingTitle, String dkswDepartmentGreetingPicture,
			String dkswDepartmentGreetingContent, int dkswDepartmentGreetingEditDate, int dkswMemberNo) {
		super();
		this.dkswDepartmentGreetingTitle = dkswDepartmentGreetingTitle;
		this.dkswDepartmentGreetingPicture = dkswDepartmentGreetingPicture;
		this.dkswDepartmentGreetingContent = dkswDepartmentGreetingContent;
		this.dkswDepartmentGreetingEditDate = dkswDepartmentGreetingEditDate;
		this.dkswMemberNo = dkswMemberNo;
	}
}
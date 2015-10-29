package dksw.model.domain;

public class DepartmentClub {

	private int dkswDepartmentClubNo;
	private String dkswDepartmentClubNameKo;
	private String dkswDepartmentClubNameEn;
	private String dkswDepartmentClubContent;
	private String dkswDepartmentClubPicture;
	private int dkswDepartmentClubEditDate;
	private int dkswDepartmentClubEditRightIndex;
	
	public int getDkswDepartmentClubNo() {
		return dkswDepartmentClubNo;
	}



	public void setDkswDepartmentClubNo(int dkswDepartmentClubNo) {
		this.dkswDepartmentClubNo = dkswDepartmentClubNo;
	}



	public String getDkswDepartmentClubNameKo() {
		return dkswDepartmentClubNameKo;
	}



	public void setDkswDepartmentClubNameKo(String dkswDepartmentClubNameKo) {
		this.dkswDepartmentClubNameKo = dkswDepartmentClubNameKo;
	}



	public String getDkswDepartmentClubNameEn() {
		return dkswDepartmentClubNameEn;
	}



	public void setDkswDepartmentClubNameEn(String dkswDepartmentClubNameEn) {
		this.dkswDepartmentClubNameEn = dkswDepartmentClubNameEn;
	}



	public String getDkswDepartmentClubPicture() {
		return dkswDepartmentClubPicture;
	}



	public void setDkswDepartmentClubPicture(String dkswDepartmentClubPicture) {
		this.dkswDepartmentClubPicture = dkswDepartmentClubPicture;
	}



	public String getDkswDepartmentClubContent() {
		return dkswDepartmentClubContent;
	}



	public void setDkswDepartmentClubContent(String dkswDepartmentClubContent) {
		this.dkswDepartmentClubContent = dkswDepartmentClubContent;
	}



	public int getDkswDepartmentClubEditDate() {
		return dkswDepartmentClubEditDate;
	}



	public void setDkswDepartmentClubEditDate(int dkswDepartmentClubEditDate) {
		this.dkswDepartmentClubEditDate = dkswDepartmentClubEditDate;
	}



	public int getDkswDepartmentClubEditRightIndex() {
		return dkswDepartmentClubEditRightIndex;
	}



	public void setDkswDepartmentClubEditRightIndex(int dkswDepartmentClubEditRightIndex) {
		this.dkswDepartmentClubEditRightIndex = dkswDepartmentClubEditRightIndex;
	}
	
	
	public DepartmentClub(int dkswDepartmentClubNo, String dkswDepartmentClubNameKo, String dkswDepartmentClubNameEn,
			String dkswDepartmentClubContent, String dkswDepartmentClubPicture, int dkswDepartmentClubEditDate,
			int dkswDepartmentClubEditRightIndex) {
		super();
		this.dkswDepartmentClubNo = dkswDepartmentClubNo;
		this.dkswDepartmentClubNameKo = dkswDepartmentClubNameKo;
		this.dkswDepartmentClubNameEn = dkswDepartmentClubNameEn;
		this.dkswDepartmentClubContent = dkswDepartmentClubContent;
		this.dkswDepartmentClubPicture = dkswDepartmentClubPicture;
		this.dkswDepartmentClubEditDate = dkswDepartmentClubEditDate;
		this.dkswDepartmentClubEditRightIndex = dkswDepartmentClubEditRightIndex;
	}
}
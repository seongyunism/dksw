package dksw.model.domain;

public class DepartmentIntro {

	private String dkswDepartmentIntroductionContent;
	private int dkswDepartmentIntroductionEditDate;
	private int dkswDepartmentIntroductionEditRightIndex;

	public String getdkswDepartmentIntroductionContent() {
		return dkswDepartmentIntroductionContent;
	}

	public void setdkswDepartmentIntroductionContent() {
		this.dkswDepartmentIntroductionContent = dkswDepartmentIntroductionContent;
	}

	public int getDkswDepartmentIntroductionEditDate() {
		return dkswDepartmentIntroductionEditDate;
	}

	public void setDkswDepartmentIntroductionEditDate(int dkswDepartmentIntroductionEditDate) {
		this.dkswDepartmentIntroductionEditDate = dkswDepartmentIntroductionEditDate;
	}

	public int getDkswDepartmentIntroductionEditRightIndex() {
		return dkswDepartmentIntroductionEditRightIndex;
	}

	public void setDkswDepartmentIntroductionEditRightIndex(int dkswDepartmentIntroductionEditRightIndex) {
		this.dkswDepartmentIntroductionEditRightIndex = dkswDepartmentIntroductionEditRightIndex;
	}

	public DepartmentIntro(String dkswDepartmentIntroductionContent, int dkswDepartmentIntroductionEditDate,
			int dkswDepartmentIntroductionEditRightIndex) {
		super();
		this.dkswDepartmentIntroductionContent = dkswDepartmentIntroductionContent;
		this.dkswDepartmentIntroductionEditDate = dkswDepartmentIntroductionEditDate;
		this.dkswDepartmentIntroductionEditRightIndex = dkswDepartmentIntroductionEditRightIndex;
	}
}
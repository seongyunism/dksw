package dksw.model.domain;

public class LabIntro {
	private int dkswLabCode;
	private String dkswLabIntroIntroduction;
	private String dkswLabIntroPicture;
	private int dkswLabIntroEditDate;
	private int dkswLabIntroEditRightIndex;
	
	public int getDkswLabCode() {
		return dkswLabCode;
	}
	public void setDkswLabCode(int dkswLabCode) {
		this.dkswLabCode = dkswLabCode;
	}
	public String getDkswLabIntroIntroduction() {
		return dkswLabIntroIntroduction;
	}
	public void setDkswLabIntroIntroduction(String dkswLabIntroIntroduction) {
		this.dkswLabIntroIntroduction = dkswLabIntroIntroduction;
	}
	public String getDkswLabIntroPicture() {
		return dkswLabIntroPicture;
	}
	public void setDkswLabIntroPicture(String dkswLabIntroPicture) {
		this.dkswLabIntroPicture = dkswLabIntroPicture;
	}
	public int getDkswLabIntroEditDate() {
		return dkswLabIntroEditDate;
	}
	public void setDkswLabIntroEditDate(int dkswLabIntroEditDate) {
		this.dkswLabIntroEditDate = dkswLabIntroEditDate;
	}
	public int getDkswLabIntroEditRightIndex() {
		return dkswLabIntroEditRightIndex;
	}
	public void setDkswLabIntroEditRightIndex(int dkswLabIntroEditRightIndex) {
		this.dkswLabIntroEditRightIndex = dkswLabIntroEditRightIndex;
	}
	
	public LabIntro(int dkswLabCode, String dkswLabIntroIntroduction, String dkswLabIntroPicture,
			int dkswLabIntroEditDate, int dkswLabIntroEditRightIndex) {
		super();
		this.dkswLabCode = dkswLabCode;
		this.dkswLabIntroIntroduction = dkswLabIntroIntroduction;
		this.dkswLabIntroPicture = dkswLabIntroPicture;
		this.dkswLabIntroEditDate = dkswLabIntroEditDate;
		this.dkswLabIntroEditRightIndex = dkswLabIntroEditRightIndex;
	}
}
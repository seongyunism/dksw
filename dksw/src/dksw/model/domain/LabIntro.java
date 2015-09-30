package dksw.model.domain;

public class LabIntro {
	private int dkswLabCode;
	private String dkswLabIntroIntroduction;
	private String dkswLabIntroProfessor;
	private String dkswLabIntroEmail;
	private String dkswLabIntroContact;
	private String dkswLabIntroResearch;
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
	public String getDkswLabIntroProfessor() {
		return dkswLabIntroProfessor;
	}
	public void setDkswLabIntroProfessor(String dkswLabIntroProfessor) {
		this.dkswLabIntroProfessor = dkswLabIntroProfessor;
	}
	public String getDkswLabIntroEmail() {
		return dkswLabIntroEmail;
	}
	public void setDkswLabIntroEmail(String dkswLabIntroEmail) {
		this.dkswLabIntroEmail = dkswLabIntroEmail;
	}
	public String getDkswLabIntroContact() {
		return dkswLabIntroContact;
	}
	public void setDkswLabIntroContact(String dkswLabIntroContact) {
		this.dkswLabIntroContact = dkswLabIntroContact;
	}
	public String getDkswLabIntroResearch() {
		return dkswLabIntroResearch;
	}
	public void setDkswLabIntroResearch(String dkswLabIntroResearch) {
		this.dkswLabIntroResearch = dkswLabIntroResearch;
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
	
	public LabIntro(int dkswLabCode, String dkswLabIntroIntroduction, String dkswLabIntroProfessor,
			String dkswLabIntroEmail, String dkswLabIntroContact, String dkswLabIntroResearch,
			String dkswLabIntroPicture, int dkswLabIntroEditDate, int dkswLabIntroEditRightIndex) {
		super();
		this.dkswLabCode = dkswLabCode;
		this.dkswLabIntroIntroduction = dkswLabIntroIntroduction;
		this.dkswLabIntroProfessor = dkswLabIntroProfessor;
		this.dkswLabIntroEmail = dkswLabIntroEmail;
		this.dkswLabIntroContact = dkswLabIntroContact;
		this.dkswLabIntroResearch = dkswLabIntroResearch;
		this.dkswLabIntroPicture = dkswLabIntroPicture;
		this.dkswLabIntroEditDate = dkswLabIntroEditDate;
		this.dkswLabIntroEditRightIndex = dkswLabIntroEditRightIndex;
	}
}

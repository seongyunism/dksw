package dksw.model.domain;

public class LabPaper {
	
	private int dkswLabPaperNo;
	private int dkswLabCode;
	private String dkswLabPaperTitle;
	private String dkswLabPaperContent;
	private String dkswLabPaperParticipants;
	private int dkswLabPaperEditDate;
	private int dkswLabPaperEditRightIndex;
	
	public int getDkswLabPaperNo() {
		return dkswLabPaperNo;
	}
	public void setDkswLabPaperNo(int dkswLabPaperNo) {
		this.dkswLabPaperNo = dkswLabPaperNo;
	}
	public int getDkswLabCode() {
		return dkswLabCode;
	}
	public void setDkswLabCode(int dkswLabCode) {
		this.dkswLabCode = dkswLabCode;
	}
	public String getDkswLabPaperTitle() {
		return dkswLabPaperTitle;
	}
	public void setDkswLabPaperTitle(String dkswLabPaperTitle) {
		this.dkswLabPaperTitle = dkswLabPaperTitle;
	}
	public String getDkswLabPaperContent() {
		return dkswLabPaperContent;
	}
	public void setDkswLabPaperContent(String dkswLabPaperContent) {
		this.dkswLabPaperContent = dkswLabPaperContent;
	}
	public String getDkswLabPaperParticipants() {
		return dkswLabPaperParticipants;
	}
	public void setDkswLabPaperParticipants(String dkswLabPaperParticipants) {
		this.dkswLabPaperParticipants = dkswLabPaperParticipants;
	}
	public int getDkswLabPaperEditDate() {
		return dkswLabPaperEditDate;
	}
	public void setDkswLabPaperEditDate(int dkswLabPaperEditDate) {
		this.dkswLabPaperEditDate = dkswLabPaperEditDate;
	}
	public int getDkswLabPaperEditRightIndex() {
		return dkswLabPaperEditRightIndex;
	}
	public void setDkswLabPaperEditRightIndex(int dkswLabPaperEditRightIndex) {
		this.dkswLabPaperEditRightIndex = dkswLabPaperEditRightIndex;
	}
	
	public LabPaper(int dkswLabPaperNo, int dkswLabCode, String dkswLabPaperTitle, String dkswLabPaperContent,
			String dkswLabPaperParticipants, int dkswLabPaperEditDate, int dkswLabPaperEditRightIndex) {
		super();
		this.dkswLabPaperNo = dkswLabPaperNo;
		this.dkswLabCode = dkswLabCode;
		this.dkswLabPaperTitle = dkswLabPaperTitle;
		this.dkswLabPaperContent = dkswLabPaperContent;
		this.dkswLabPaperParticipants = dkswLabPaperParticipants;
		this.dkswLabPaperEditDate = dkswLabPaperEditDate;
		this.dkswLabPaperEditRightIndex = dkswLabPaperEditRightIndex;
	}
	
}

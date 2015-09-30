package dksw.model.domain;

public class LabMembers {
	
	private int dkswLabCode;
	private String dkswLabMembersPicture;
	private String dkswLabMembersName;
	private String dkswLabMembersStudentNumber;
	private String dkswLabMembersEmail;
	private String dkswLabMembersGroup;
	private String dkswLabMembersEtc;
	private int dkswLabMembersEditDate;
	private int dkswLabMembersEditRightIndex;
	
	public int getDkswLabCode() {
		return dkswLabCode;
	}
	public void setDkswLabCode(int dkswLabCode) {
		this.dkswLabCode = dkswLabCode;
	}
	public String getDkswLabMembersPicture() {
		return dkswLabMembersPicture;
	}
	public void setDkswLabMembersPicture(String dkswLabMembersPicture) {
		this.dkswLabMembersPicture = dkswLabMembersPicture;
	}
	public String getDkswLabMembersName() {
		return dkswLabMembersName;
	}
	public void setDkswLabMembersName(String dkswLabMembersName) {
		this.dkswLabMembersName = dkswLabMembersName;
	}
	public String getDkswLabMembersStudentNumber() {
		return dkswLabMembersStudentNumber;
	}
	public void setDkswLabMembersStudentNumber(String dkswLabMembersStudentNumber) {
		this.dkswLabMembersStudentNumber = dkswLabMembersStudentNumber;
	}
	public String getDkswLabMembersEmail() {
		return dkswLabMembersEmail;
	}
	public void setDkswLabMembersEmail(String dkswLabMembersEmail) {
		this.dkswLabMembersEmail = dkswLabMembersEmail;
	}
	public String getDkswLabMembersGroup() {
		return dkswLabMembersGroup;
	}
	public void setDkswLabMembersGroup(String dkswLabMembersGroup) {
		this.dkswLabMembersGroup = dkswLabMembersGroup;
	}
	public String getDkswLabMembersEtc() {
		return dkswLabMembersEtc;
	}
	public void setDkswLabMembersEtc(String dkswLabMembersEtc) {
		this.dkswLabMembersEtc = dkswLabMembersEtc;
	}
	public int getDkswLabMembersEditDate() {
		return dkswLabMembersEditDate;
	}
	public void setDkswLabMembersEditDate(int dkswLabMembersEditDate) {
		this.dkswLabMembersEditDate = dkswLabMembersEditDate;
	}
	public int getDkswLabMembersEditRightIndex() {
		return dkswLabMembersEditRightIndex;
	}
	public void setDkswLabMembersEditRightIndex(int dkswLabMembersEditRightIndex) {
		this.dkswLabMembersEditRightIndex = dkswLabMembersEditRightIndex;
	}
	
	public LabMembers(int dkswLabCode, String dkswLabMembersPicture, String dkswLabMembersName,
			String dkswLabMembersStudentNumber, String dkswLabMembersEmail, String dkswLabMembersGroup,
			String dkswLabMembersEtc, int dkswLabMembersEditDate, int dkswLabMembersEditRightIndex) {
		super();
		this.dkswLabCode = dkswLabCode;
		this.dkswLabMembersPicture = dkswLabMembersPicture;
		this.dkswLabMembersName = dkswLabMembersName;
		this.dkswLabMembersStudentNumber = dkswLabMembersStudentNumber;
		this.dkswLabMembersEmail = dkswLabMembersEmail;
		this.dkswLabMembersGroup = dkswLabMembersGroup;
		this.dkswLabMembersEtc = dkswLabMembersEtc;
		this.dkswLabMembersEditDate = dkswLabMembersEditDate;
		this.dkswLabMembersEditRightIndex = dkswLabMembersEditRightIndex;
	}
}

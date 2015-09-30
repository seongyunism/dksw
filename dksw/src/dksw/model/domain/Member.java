package dksw.model.domain;

public class Member {

	private int dkswMemberNo;
	private int dkswMemberCategory;
	private String dkswMemberEmail;
	private String dkswMemberPassword;
	private String dkswMemberStudentNo;
	private String dkswMemberName;
	private int dkswMemberSNS;
	private int dkswMemberJoin;
	private String dkswMemberJoinCode;
	private int dkswMemberAuth;
	
	public int getDkswMemberNo() {
		return dkswMemberNo;
	}
	public void setDkswMemberNo(int dkswMemberNo) {
		this.dkswMemberNo = dkswMemberNo;
	}
	public int getDkswMemberCategory() {
		return dkswMemberCategory;
	}
	public void setDkswMemberCategory(int dkswMemberCategory) {
		this.dkswMemberCategory = dkswMemberCategory;
	}
	public String getDkswMemberEmail() {
		return dkswMemberEmail;
	}
	public void setDkswMemberEmail(String dkswMemberEmail) {
		this.dkswMemberEmail = dkswMemberEmail;
	}
	public String getDkswMemberPassword() {
		return dkswMemberPassword;
	}
	public void setDkswMemberPassword(String dkswMemberPassword) {
		this.dkswMemberPassword = dkswMemberPassword;
	}
	public String getDkswMemberStudentNo() {
		return dkswMemberStudentNo;
	}
	public void setDkswMemberStudentNo(String dkswMemberStudentNo) {
		this.dkswMemberStudentNo = dkswMemberStudentNo;
	}
	public String getDkswMemberName() {
		return dkswMemberName;
	}
	public void setDkswMemberName(String dkswMemberName) {
		this.dkswMemberName = dkswMemberName;
	}
	public int getDkswMemberSNS() {
		return dkswMemberSNS;
	}
	public void setDkswMemberSNS(int dkswMemberSNS) {
		this.dkswMemberSNS = dkswMemberSNS;
	}
	public int getDkswMemberJoin() {
		return dkswMemberJoin;
	}
	public void setDkswMemberJoin(int dkswMemberJoin) {
		this.dkswMemberJoin = dkswMemberJoin;
	}
	public String getDkswMemberJoinCode() {
		return dkswMemberJoinCode;
	}
	public void setDkswMemberJoinCode(String dkswMemberJoinCode) {
		this.dkswMemberJoinCode = dkswMemberJoinCode;
	}
	public int getDkswMemberAuth() {
		return dkswMemberAuth;
	}
	public void setDkswMemberAuth(int dkswMemberAuth) {
		this.dkswMemberAuth = dkswMemberAuth;
	}
	
	public Member(int dkswMemberNo, int dkswMemberCategory,
			String dkswMemberEmail, String dkswMemberPassword,
			String dkswMemberStudentNo, String dkswMemberName,
			int dkswMemberSNS, int dkswMemberJoin, String dkswMemberJoinCode,
			int dkswMemberAuth) {
		super();
		this.dkswMemberNo = dkswMemberNo;
		this.dkswMemberCategory = dkswMemberCategory;
		this.dkswMemberEmail = dkswMemberEmail;
		this.dkswMemberPassword = dkswMemberPassword;
		this.dkswMemberStudentNo = dkswMemberStudentNo;
		this.dkswMemberName = dkswMemberName;
		this.dkswMemberSNS = dkswMemberSNS;
		this.dkswMemberJoin = dkswMemberJoin;
		this.dkswMemberJoinCode = dkswMemberJoinCode;
		this.dkswMemberAuth = dkswMemberAuth;
	}
	
}

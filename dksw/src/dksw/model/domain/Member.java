package dksw.model.domain;

public class Member {

	private int dkswMemberNo;
	private int dkswMemberCategory;
	private String dkswMemberEmail;
	private String dkswMemberPassword;
	private String dkswMemberStudentNo;
	private String dkswMemberName;
	private int dkswMemberSNS;
	private int dkswMemberOnlineAuth;
	private String dkswMemberOnlineAuthCode;
	private int dkswMemberOfflineAuthCode;
	private int dkswMemberJoinDate;
	private int dkswMemberAdminAuth;
	
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
	public int getDkswMemberOnlineAuth() {
		return dkswMemberOnlineAuth;
	}
	public void setDkswMemberOnlineAuth(int dkswMemberOnlineAuth) {
		this.dkswMemberOnlineAuth = dkswMemberOnlineAuth;
	}
	public String getDkswMemberOnlineAuthCode() {
		return dkswMemberOnlineAuthCode;
	}
	public void setDkswMemberOnlineAuthCode(String dkswMemberOnlineAuthCode) {
		this.dkswMemberOnlineAuthCode = dkswMemberOnlineAuthCode;
	}
	public int getDkswMemberOfflineAuthCode() {
		return dkswMemberOfflineAuthCode;
	}
	public void setDkswMemberOfflineAuthCode(int dkswMemberOfflineAuthCode) {
		this.dkswMemberOfflineAuthCode = dkswMemberOfflineAuthCode;
	}
	public int getDkswMemberJoinDate() {
		return dkswMemberJoinDate;
	}
	public void setDkswMemberJoinDate(int dkswMemberJoinDate) {
		this.dkswMemberJoinDate = dkswMemberJoinDate;
	}
	public int getDkswMemberAdminAuth() {
		return dkswMemberAdminAuth;
	}
	public void setDkswMemberAdminAuth(int dkswMemberAdminAuth) {
		this.dkswMemberAdminAuth = dkswMemberAdminAuth;
	}
	
	public Member(int dkswMemberNo, int dkswMemberCategory,
			String dkswMemberEmail, String dkswMemberPassword,
			String dkswMemberStudentNo, String dkswMemberName,
			int dkswMemberSNS, int dkswMemberOnlineAuth,
			String dkswMemberOnlineAuthCode, int dkswMemberOfflineAuthCode,
			int dkswMemberJoinDate, int dkswMemberAdminAuth) {
		super();
		this.dkswMemberNo = dkswMemberNo;
		this.dkswMemberCategory = dkswMemberCategory;
		this.dkswMemberEmail = dkswMemberEmail;
		this.dkswMemberPassword = dkswMemberPassword;
		this.dkswMemberStudentNo = dkswMemberStudentNo;
		this.dkswMemberName = dkswMemberName;
		this.dkswMemberSNS = dkswMemberSNS;
		this.dkswMemberOnlineAuth = dkswMemberOnlineAuth;
		this.dkswMemberOnlineAuthCode = dkswMemberOnlineAuthCode;
		this.dkswMemberOfflineAuthCode = dkswMemberOfflineAuthCode;
		this.dkswMemberJoinDate = dkswMemberJoinDate;
		this.dkswMemberAdminAuth = dkswMemberAdminAuth;
	}
}

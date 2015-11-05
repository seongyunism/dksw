package dksw.model.domain;

public class MemberSNS {

	private int dkswMemberSNSCategory;
	private String dkswMemberSNSId;
	private String dkswMemberSNSToken;
	private int dkswMemberNo;
	
	public int getDkswMemberSNSCategory() {
		return dkswMemberSNSCategory;
	}
	public void setDkswMemberSNSCategory(int dkswMemberSNSCategory) {
		this.dkswMemberSNSCategory = dkswMemberSNSCategory;
	}
	public String getDkswMemberSNSId() {
		return dkswMemberSNSId;
	}
	public void setDkswMemberSNSId(String dkswMemberSNSId) {
		this.dkswMemberSNSId = dkswMemberSNSId;
	}
	public String getDkswMemberSNSToken() {
		return dkswMemberSNSToken;
	}
	public void setDkswMemberSNSToken(String dkswMemberSNSToken) {
		this.dkswMemberSNSToken = dkswMemberSNSToken;
	}
	public int getDkswMemberNo() {
		return dkswMemberNo;
	}
	public void setDkswMemberNo(int dkswMemberNo) {
		this.dkswMemberNo = dkswMemberNo;
	}
	
	public MemberSNS(int dkswMemberSNSCategory, String dkswMemberSNSId, String dkswMemberSNSToken, int dkswMemberNo) {
		super();
		this.dkswMemberSNSCategory = dkswMemberSNSCategory;
		this.dkswMemberSNSId = dkswMemberSNSId;
		this.dkswMemberSNSToken = dkswMemberSNSToken;
		this.dkswMemberNo = dkswMemberNo;
	}
}
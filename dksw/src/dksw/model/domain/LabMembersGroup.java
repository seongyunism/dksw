package dksw.model.domain;

public class LabMembersGroup {

	private int dkswLabMembersGroupNo;
	private String dkswLabMembersGroupNameKo;
	private String dkswLabMembersGroupNameEn;
	
	public int getDkswLabMembersGroupNo() {
		return dkswLabMembersGroupNo;
	}
	public void setDkswLabMembersGroupNo(int dkswLabMembersGroupNo) {
		this.dkswLabMembersGroupNo = dkswLabMembersGroupNo;
	}
	public String getDkswLabMembersGroupNameKo() {
		return dkswLabMembersGroupNameKo;
	}
	public void setDkswLabMembersGroupNameKo(String dkswLabMembersGroupNameKo) {
		this.dkswLabMembersGroupNameKo = dkswLabMembersGroupNameKo;
	}
	public String getDkswLabMembersGroupNameEn() {
		return dkswLabMembersGroupNameEn;
	}
	public void setDkswLabMembersGroupNameEn(String dkswLabMembersGroupNameEn) {
		this.dkswLabMembersGroupNameEn = dkswLabMembersGroupNameEn;
	}
	
	public LabMembersGroup(int dkswLabMembersGroupNo, String dkswLabMembersGroupNameKo,
			String dkswLabMembersGroupNameEn) {
		super();
		this.dkswLabMembersGroupNo = dkswLabMembersGroupNo;
		this.dkswLabMembersGroupNameKo = dkswLabMembersGroupNameKo;
		this.dkswLabMembersGroupNameEn = dkswLabMembersGroupNameEn;
	}
}
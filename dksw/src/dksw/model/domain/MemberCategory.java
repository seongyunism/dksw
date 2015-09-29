package dksw.model.domain;

public class MemberCategory {

	private int dkswMemberCategoryNo;
	private String dkswMemberCategoryName;
	
	public int getDkswMemberCategoryNo() {
		return dkswMemberCategoryNo;
	}
	public void setDkswMemberCategoryNo(int dkswMemberCategoryNo) {
		this.dkswMemberCategoryNo = dkswMemberCategoryNo;
	}
	public String getDkswMemberCategoryName() {
		return dkswMemberCategoryName;
	}
	public void setDkswMemberCategoryName(String dkswMemberCategoryName) {
		this.dkswMemberCategoryName = dkswMemberCategoryName;
	}

	public MemberCategory(int dkswMemberCategoryNo,
			String dkswMemberCategoryName) {
		super();
		this.dkswMemberCategoryNo = dkswMemberCategoryNo;
		this.dkswMemberCategoryName = dkswMemberCategoryName;
	}
}

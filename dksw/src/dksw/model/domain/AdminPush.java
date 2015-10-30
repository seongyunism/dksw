package dksw.model.domain;

public class AdminPush {

	private long dkswAdminPushDate;
	private String dkswAdminPushMsg;
	private int dkswMemberNo;
	
	public long getDkswAdminPushDate() {
		return dkswAdminPushDate;
	}
	public void setDkswAdminPushDate(long dkswAdminPushDate) {
		this.dkswAdminPushDate = dkswAdminPushDate;
	}
	public String getDkswAdminPushMsg() {
		return dkswAdminPushMsg;
	}
	public void setDkswAdminPushMsg(String dkswAdminPushMsg) {
		this.dkswAdminPushMsg = dkswAdminPushMsg;
	}
	public int getDkswMemberNo() {
		return dkswMemberNo;
	}
	public void setDkswMemberNo(int dkswMemberNo) {
		this.dkswMemberNo = dkswMemberNo;
	}
	
	public AdminPush(long dkswAdminPushDate, String dkswAdminPushMsg, int dkswMemberNo) {
		super();
		this.dkswAdminPushDate = dkswAdminPushDate;
		this.dkswAdminPushMsg = dkswAdminPushMsg;
		this.dkswMemberNo = dkswMemberNo;
	}
}

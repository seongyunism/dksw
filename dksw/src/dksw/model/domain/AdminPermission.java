package dksw.model.domain;

public class AdminPermission {

	private String dkswMenuNo;
	private long dkswAdminPermissionEditdate;
	private String dkswAdminPermissionMaster;
	private String dkswAdminPermissionAuthor;
	
	public String getDkswMenuNo() {
		return dkswMenuNo;
	}
	public void setDkswMenuNo(String dkswMenuNo) {
		this.dkswMenuNo = dkswMenuNo;
	}
	public long getDkswAdminPermissionEditdate() {
		return dkswAdminPermissionEditdate;
	}
	public void setDkswAdminPermissionEditdate(long dkswAdminPermissionEditdate) {
		this.dkswAdminPermissionEditdate = dkswAdminPermissionEditdate;
	}
	public String getDkswAdminPermissionMaster() {
		return dkswAdminPermissionMaster;
	}
	public void setDkswAdminPermissionMaster(String dkswAdminPermissionMaster) {
		this.dkswAdminPermissionMaster = dkswAdminPermissionMaster;
	}
	public String getDkswAdminPermissionAuthor() {
		return dkswAdminPermissionAuthor;
	}
	public void setDkswAdminPermissionAuthor(String dkswAdminPermissionAuthor) {
		this.dkswAdminPermissionAuthor = dkswAdminPermissionAuthor;
	}
	
	public AdminPermission(String dkswMenuNo, long dkswAdminPermissionEditdate, String dkswAdminPermissionMaster,
			String dkswAdminPermissionAuthor) {
		super();
		this.dkswMenuNo = dkswMenuNo;
		this.dkswAdminPermissionEditdate = dkswAdminPermissionEditdate;
		this.dkswAdminPermissionMaster = dkswAdminPermissionMaster;
		this.dkswAdminPermissionAuthor = dkswAdminPermissionAuthor;
	}
}
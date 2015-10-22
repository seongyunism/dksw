package dksw.model.domain;

public class AdminPermission {

	private String dkswAdminPermissionId;
	private long dkswAdminPermissionEditdate;
	private String dkswAdminPermissionMaster;
	private String dkswAdminPermissionAuthor;
	
	public String getDkswAdminPermissionId() {
		return dkswAdminPermissionId;
	}
	public void setDkswAdminPermissionId(String dkswAdminPermissionId) {
		this.dkswAdminPermissionId = dkswAdminPermissionId;
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
	
	public AdminPermission(String dkswAdminPermissionId, long dkswAdminPermissionEditdate,
			String dkswAdminPermissionMaster, String dkswAdminPermissionAuthor) {
		super();
		this.dkswAdminPermissionId = dkswAdminPermissionId;
		this.dkswAdminPermissionEditdate = dkswAdminPermissionEditdate;
		this.dkswAdminPermissionMaster = dkswAdminPermissionMaster;
		this.dkswAdminPermissionAuthor = dkswAdminPermissionAuthor;
	}
}
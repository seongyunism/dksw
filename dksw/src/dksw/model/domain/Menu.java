package dksw.model.domain;

public class Menu {

	private int dkswAdminMenuNo;
	private String dkswAdminMenuName;
	
	public int getDkswAdminMenuNo() {
		return dkswAdminMenuNo;
	}
	public void setDkswAdminMenuNo(int dkswAdminMenuNo) {
		this.dkswAdminMenuNo = dkswAdminMenuNo;
	}
	public String getDkswAdminMenuName() {
		return dkswAdminMenuName;
	}
	public void setDkswAdminMenuName(String dkswAdminMenuName) {
		this.dkswAdminMenuName = dkswAdminMenuName;
	}
	
	public Menu(int dkswAdminMenuNo, String dkswAdminMenuName) {
		super();
		this.dkswAdminMenuNo = dkswAdminMenuNo;
		this.dkswAdminMenuName = dkswAdminMenuName;
	}
}
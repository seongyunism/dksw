package dksw.model.domain;

public class DepartmentContact {

	private String dkswDepartmentContactNumber;
	private String dkswDepartmentContactLocation;
	private String dkswDepartmentContactEmail;
	private String dkswDepartmentContactFax;
	private String dkswDepartmentContactOffice;
	private String dkswDepartmentContactRoom;
	
	public String getDkswDepartmentContactNumber() {
		return dkswDepartmentContactNumber;
	}
	public void setDkswDepartmentContactNumber(String dkswDepartmentContactNumber) {
		this.dkswDepartmentContactNumber = dkswDepartmentContactNumber;
	}
	public String getDkswDepartmentContactLocation() {
		return dkswDepartmentContactLocation;
	}
	public void setDkswDepartmentContactLocation(String dkswDepartmentContactLocation) {
		this.dkswDepartmentContactLocation = dkswDepartmentContactLocation;
	}
	public String getDkswDepartmentContactEmail() {
		return dkswDepartmentContactEmail;
	}
	public void setDkswDepartmentContactEmail(String dkswDepartmentContactEmail) {
		this.dkswDepartmentContactEmail = dkswDepartmentContactEmail;
	}
	public String getDkswDepartmentContactFax() {
		return dkswDepartmentContactFax;
	}
	public void setDkswDepartmentContactFax(String dkswDepartmentContactFax) {
		this.dkswDepartmentContactFax = dkswDepartmentContactFax;
	}
	public String getDkswDepartmentContactOffice() {
		return dkswDepartmentContactOffice;
	}
	public void setDkswDepartmentContactOffice(String dkswDepartmentContactOffice) {
		this.dkswDepartmentContactOffice = dkswDepartmentContactOffice;
	}
	public String getDkswDepartmentContactRoom() {
		return dkswDepartmentContactRoom;
	}
	public void setDkswDepartmentContactRoom(String dkswDepartmentContactRoom) {
		this.dkswDepartmentContactRoom = dkswDepartmentContactRoom;
	}
	
	public DepartmentContact(String dkswDepartmentContactNumber, String dkswDepartmentContactLocation,
			String dkswDepartmentContactEmail, String dkswDepartmentContactFax, String dkswDepartmentContactOffice,
			String dkswDepartmentContactRoom) {
		super();
		this.dkswDepartmentContactNumber = dkswDepartmentContactNumber;
		this.dkswDepartmentContactLocation = dkswDepartmentContactLocation;
		this.dkswDepartmentContactEmail = dkswDepartmentContactEmail;
		this.dkswDepartmentContactFax = dkswDepartmentContactFax;
		this.dkswDepartmentContactOffice = dkswDepartmentContactOffice;
		this.dkswDepartmentContactRoom = dkswDepartmentContactRoom;
	}	
}

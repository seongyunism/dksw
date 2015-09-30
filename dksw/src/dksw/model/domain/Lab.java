package dksw.model.domain;

public class Lab {
	private String dkswLabName ;
	private int dkswLabCode;
	
	public String getDkswLabName() {
		return dkswLabName;
	}
	public void setDkswLabName(String dkswLabName) {
		this.dkswLabName = dkswLabName;
	}
	public int getDkswLabCode() {
		return dkswLabCode;
	}
	public void setDkswLabCode(int dkswLabCode) {
		this.dkswLabCode = dkswLabCode;
	}
	
	public Lab(String dkswLabName, int dkswLabCode) {
		super();
		this.dkswLabName = dkswLabName;
		this.dkswLabCode = dkswLabCode;
	}
}

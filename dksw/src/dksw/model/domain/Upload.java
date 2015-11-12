package dksw.model.domain;

public class Upload {

	private int dkswUploadNo;
	private int dkswUploadCategory;
	private int dkswUploadPostNo;
	private long dkswUploadDate;
	private int dkswMemberNo;
	private String dkswUploadFileName;
	private String dkswUploadFileSrc;
	
	public int getDkswUploadNo() {
		return dkswUploadNo;
	}
	public void setDkswUploadNo(int dkswUploadNo) {
		this.dkswUploadNo = dkswUploadNo;
	}
	public int getDkswUploadCategory() {
		return dkswUploadCategory;
	}
	public void setDkswUploadCategory(int dkswUploadCategory) {
		this.dkswUploadCategory = dkswUploadCategory;
	}
	public int getDkswUploadPostNo() {
		return dkswUploadPostNo;
	}
	public void setDkswUploadPostNo(int dkswUploadPostNo) {
		this.dkswUploadPostNo = dkswUploadPostNo;
	}
	public long getDkswUploadDate() {
		return dkswUploadDate;
	}
	public void setDkswUploadDate(long dkswUploadDate) {
		this.dkswUploadDate = dkswUploadDate;
	}
	public int getDkswMemberNo() {
		return dkswMemberNo;
	}
	public void setDkswMemberNo(int dkswMemberNo) {
		this.dkswMemberNo = dkswMemberNo;
	}
	public String getDkswUploadFileName() {
		return dkswUploadFileName;
	}
	public void setDkswUploadFileName(String dkswUploadFileName) {
		this.dkswUploadFileName = dkswUploadFileName;
	}
	public String getDkswUploadFileSrc() {
		return dkswUploadFileSrc;
	}
	public void setDkswUploadFileSrc(String dkswUploadFileSrc) {
		this.dkswUploadFileSrc = dkswUploadFileSrc;
	}
	
	public Upload(int dkswUploadNo, int dkswUploadCategory, int dkswUploadPostNo, long dkswUploadDate, int dkswMemberNo,
			String dkswUploadFileName, String dkswUploadFileSrc) {
		super();
		this.dkswUploadNo = dkswUploadNo;
		this.dkswUploadCategory = dkswUploadCategory;
		this.dkswUploadPostNo = dkswUploadPostNo;
		this.dkswUploadDate = dkswUploadDate;
		this.dkswMemberNo = dkswMemberNo;
		this.dkswUploadFileName = dkswUploadFileName;
		this.dkswUploadFileSrc = dkswUploadFileSrc;
	}
}
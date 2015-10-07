package dksw.model.domain;

public class Board {

	private int dkswBoardNo;
	private int dkswBoardCategory;
	private int dkswMemberNo;
	private int dkswBoardWriteDate;
	private int dkswBoardReadnum;
	private String dkswBoardTitle;
	private String dkswBoardContent;
	private String dkswBoardPicture;
	
	public int getDkswBoardNo() {
		return dkswBoardNo;
	}
	public void setDkswBoardNo(int dkswBoardNo) {
		this.dkswBoardNo = dkswBoardNo;
	}
	public int getDkswBoardCategory() {
		return dkswBoardCategory;
	}
	public void setDkswBoardCategory(int dkswBoardCategory) {
		this.dkswBoardCategory = dkswBoardCategory;
	}
	public int getDkswMemberNo() {
		return dkswMemberNo;
	}
	public void setDkswMemberNo(int dkswMemberNo) {
		this.dkswMemberNo = dkswMemberNo;
	}
	public int getDkswBoardWriteDate() {
		return dkswBoardWriteDate;
	}
	public void setDkswBoardWriteDate(int dkswBoardWriteDate) {
		this.dkswBoardWriteDate = dkswBoardWriteDate;
	}
	public int getDkswBoardReadnum() {
		return dkswBoardReadnum;
	}
	public void setDkswBoardReadnum(int dkswBoardReadnum) {
		this.dkswBoardReadnum = dkswBoardReadnum;
	}
	public String getDkswBoardTitle() {
		return dkswBoardTitle;
	}
	public void setDkswBoardTitle(String dkswBoardTitle) {
		this.dkswBoardTitle = dkswBoardTitle;
	}
	public String getDkswBoardContent() {
		return dkswBoardContent;
	}
	public void setDkswBoardContent(String dkswBoardContent) {
		this.dkswBoardContent = dkswBoardContent;
	}
	public String getDkswBoardPicture() {
		return dkswBoardPicture;
	}
	public void setDkswBoardPicture(String dkswBoardPicture) {
		this.dkswBoardPicture = dkswBoardPicture;
	}
	
	public Board(int dkswBoardNo, int dkswBoardCategory, int dkswMemberNo, int dkswBoardWriteDate, int dkswBoardReadnum,
			String dkswBoardTitle, String dkswBoardContent, String dkswBoardPicture) {
		super();
		this.dkswBoardNo = dkswBoardNo;
		this.dkswBoardCategory = dkswBoardCategory;
		this.dkswMemberNo = dkswMemberNo;
		this.dkswBoardWriteDate = dkswBoardWriteDate;
		this.dkswBoardReadnum = dkswBoardReadnum;
		this.dkswBoardTitle = dkswBoardTitle;
		this.dkswBoardContent = dkswBoardContent;
		this.dkswBoardPicture = dkswBoardPicture;
	}
}

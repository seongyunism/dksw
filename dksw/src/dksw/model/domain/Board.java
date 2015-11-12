package dksw.model.domain;

public class Board {
	
	private int dkswBoardNo;
	private int dkswBoardCategory;
	private int dkswMemberNo;
	private long dkswBoardWriteDate;
	private int dkswBoardReadnum;
	private String dkswBoardTitle;
	private String dkswBoardContent;
	private String dkswBoardFiles;
	
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
	public long getDkswBoardWriteDate() {
		return dkswBoardWriteDate;
	}
	public void setDkswBoardWriteDate(long dkswBoardWriteDate) {
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
	public String getDkswBoardFiles() {
		return dkswBoardFiles;
	}
	public void setDkswBoardFiles(String dkswBoardFiles) {
		this.dkswBoardFiles = dkswBoardFiles;
	}
	
	public Board(int dkswBoardNo, int dkswBoardCategory, int dkswMemberNo, long dkswBoardWriteDate,
			int dkswBoardReadnum, String dkswBoardTitle, String dkswBoardContent, String dkswBoardFiles) {
		super();
		this.dkswBoardNo = dkswBoardNo;
		this.dkswBoardCategory = dkswBoardCategory;
		this.dkswMemberNo = dkswMemberNo;
		this.dkswBoardWriteDate = dkswBoardWriteDate;
		this.dkswBoardReadnum = dkswBoardReadnum;
		this.dkswBoardTitle = dkswBoardTitle;
		this.dkswBoardContent = dkswBoardContent;
		this.dkswBoardFiles = dkswBoardFiles;
	}
}
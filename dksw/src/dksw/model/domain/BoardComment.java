package dksw.model.domain;

public class BoardComment {

	private int dkswBoardCommentNo;
	private int dkswBoardNo;
	private int dkswMemberNo;
	private String dkswBoardCommentContent;
	private int dkswBoardCommentWriteDate;
	
	public int getDkswBoardCommentNo() {
		return dkswBoardCommentNo;
	}
	public void setDkswBoardCommentNo(int dkswBoardCommentNo) {
		this.dkswBoardCommentNo = dkswBoardCommentNo;
	}
	public int getDkswBoardNo() {
		return dkswBoardNo;
	}
	public void setDkswBoardNo(int dkswBoardNo) {
		this.dkswBoardNo = dkswBoardNo;
	}
	public int getDkswMemberNo() {
		return dkswMemberNo;
	}
	public void setDkswMemberNo(int dkswMemberNo) {
		this.dkswMemberNo = dkswMemberNo;
	}
	public String getDkswBoardCommentContent() {
		return dkswBoardCommentContent;
	}
	public void setDkswBoardCommentContent(String dkswBoardCommentContent) {
		this.dkswBoardCommentContent = dkswBoardCommentContent;
	}
	public int getDkswBoardCommentWriteDate() {
		return dkswBoardCommentWriteDate;
	}
	public void setDkswBoardCommentWriteDate(int dkswBoardCommentWriteDate) {
		this.dkswBoardCommentWriteDate = dkswBoardCommentWriteDate;
	}
	
	public BoardComment(int dkswBoardCommentNo, int dkswBoardNo, int dkswMemberNo, String dkswBoardCommentContent,
			int dkswBoardCommentWriteDate) {
		super();
		this.dkswBoardCommentNo = dkswBoardCommentNo;
		this.dkswBoardNo = dkswBoardNo;
		this.dkswMemberNo = dkswMemberNo;
		this.dkswBoardCommentContent = dkswBoardCommentContent;
		this.dkswBoardCommentWriteDate = dkswBoardCommentWriteDate;
	}
	
	
	
}

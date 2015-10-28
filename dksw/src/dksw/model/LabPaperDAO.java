package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.LabPaper;
import dksw.util.DBUtil;

public class LabPaperDAO {

	public static ArrayList<LabPaper> getLabPaper(int inputLabCode) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<LabPaper> papers = new ArrayList<LabPaper>();
		LabPaper paper = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_lab_paper WHERE dkswLabCode=?");
			pstmt.setInt(1, inputLabCode);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				paper = new LabPaper(
						rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getInt(6),
						rset.getInt(7)
				);
				papers.add(paper);
			}

			return papers;
			
		} catch (SQLException se) {
			se.printStackTrace();
			throw se;
	
		} finally {
			try {
				DBUtil.close(con, pstmt, rset);
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
	}	

	//새로운 값 삽입
	public static boolean writeRecord(int inputLabCode, String inputLabData1, String inputLabData2, String inputLabData3) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		int writeQueryCount = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_lab_paper(dkswLabCode, dkswLabPaperTitle, dkswLabPaperContent, dkswLabPaperParticipants) values(?, ?, ?, ?)");
		
			System.out.println(inputLabCode);
			System.out.println(inputLabData1);
			System.out.println(inputLabData2);
			System.out.println(inputLabData3);

			
			
			pstmt.setInt(1, inputLabCode);
			pstmt.setString(2, inputLabData1);
			pstmt.setString(3, inputLabData2);
			pstmt.setString(4, inputLabData3);
			writeQueryCount = pstmt.executeUpdate();
			
			if(writeQueryCount == 1) {
				return true;
			} else {
				return false;
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
			throw se;
	
		} finally {
			try {
				DBUtil.close(con, pstmt, rset);
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
	}
	//삭제 
	public static boolean deleteRecord(int inputLabRecordNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
			
		int deleteQueryCount = 0;
			
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("DELETE FROM dksw_lab_paper WHERE dkswLabPaperNo=?");
			pstmt.setInt(1, inputLabRecordNo);
			deleteQueryCount = pstmt.executeUpdate();

			if(deleteQueryCount == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException se) {
			se.printStackTrace();
			throw se;
				
		} finally {
			try {
				DBUtil.close(con, pstmt, rset);
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}	
	}
	
}

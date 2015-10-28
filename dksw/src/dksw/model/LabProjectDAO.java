package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.LabProject;
import dksw.util.DBUtil;

public class LabProjectDAO {

	public static ArrayList<LabProject> getLabProject(int inputLabCode) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<LabProject> projects = new ArrayList<LabProject>();
		LabProject project = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_lab_project WHERE dkswLabCode=?");
			pstmt.setInt(1, inputLabCode);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				project = new LabProject(
						rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6),
						rset.getString(7),
						rset.getString(8),
						rset.getInt(9),
						rset.getInt(10)
				);
				projects.add(project);
			}

			return projects;
			
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

	
	
	public static boolean deleteRecord(int inputLabRecordNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
			
		int deleteQueryCount = 0;
			
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("DELETE FROM dksw_lab_project WHERE dkswLabProjectNo=?");
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

	public static boolean writeRecord(int inputLabCode, String inputLabData1, String inputLabData2, String inputLabData3, String inputLabData4,String inputLabData5,String inputLabData6) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		int writeQueryCount = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_lab_project(dkswLabCode, dkswLabProjectStartYear, dkswLabProjectStartMonth, dkswLabProjectEndYear,dkswLabProjectEndMonth, dkswLabProjectContent,dkswLabProjectName) values(?, ?, ?, ?, ?, ?, ?)");
		
			pstmt.setInt(1, inputLabCode);
			pstmt.setString(2, inputLabData1);
			pstmt.setString(3, inputLabData2);
			pstmt.setString(4, inputLabData3);
			pstmt.setString(5, inputLabData4);
			pstmt.setString(6, inputLabData5);
			pstmt.setString(7, inputLabData6);
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
}

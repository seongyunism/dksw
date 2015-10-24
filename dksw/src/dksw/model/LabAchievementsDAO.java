package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.LabAchievements;
import dksw.util.DBUtil;

public class LabAchievementsDAO {

	public static ArrayList<LabAchievements> getLabAchievements(int inputLabCode) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<LabAchievements> achievements = new ArrayList<LabAchievements>();
		LabAchievements achievement = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_lab_achievements WHERE dkswLabCode=? ORDER BY dkswLabAchievementsYear ASC, dkswLabAchievementsMonth ASC");
			pstmt.setInt(1, inputLabCode);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				achievement = new LabAchievements(
						rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getInt(6),
						rset.getInt(7)
				);
				
				achievements.add(achievement);
			}
			
			return achievements;
			
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

	public static boolean writeRecord(int inputLabCode, String inputLabData1, String inputLabData2, String inputLabData3) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		int writeQueryCount = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_lab_achievements(dkswLabCode, dkswLabAchievementsYear, dkswLabAchievementsMonth, dkswLabAchievementsContent) values(?, ?, ?, ?)");
		
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
	
	public static boolean deleteRecord(int inputLabRecordNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
			
		int deleteQueryCount = 0;
			
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("DELETE FROM dksw_lab_achievements WHERE dkswLabAchievementsNo=?");
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

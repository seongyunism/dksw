package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.LabMembers;
import dksw.util.DBUtil;

public class LabMembersDAO {

	public static ArrayList<LabMembers> getLabMembers(int inputLabCode) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<LabMembers> members = new ArrayList<LabMembers>();
		LabMembers member = null;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("SELECT * FROM dksw_lab_members WHERE dkswLabCode=? ORDER BY dkswLabMembersGroup ASC, dkswLabMembersNameKo ASC");
			pstmt.setInt(1, inputLabCode);
			rset = pstmt.executeQuery();
				
			while (rset.next()) {
				member = new LabMembers(
						rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6),
						rset.getString(7),
						rset.getString(8),
						rset.getInt(9)
					);
				
				members.add(member);
			}
			
			return members;

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
	
	// 수정요망
	public static boolean addLabMembers(int inputLabMembersCode, String inputLabMembersPicture, String inputLabMembersNameKo,
			String inputLabMembersNameEn, String inputLabMembersAdmissionYear, String inputLabMembersEmail, int inputLabMembersGroup, 
			String inputLabMembersEtc, long inputLabMembersEditdate ,int inputLabMembersEditRightIndex, int inputDepartmentProfessorNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_lab_members("
					+ "inputLabMembersCode, inputLabMembersPicture, inputLabMembersNameKo, inputLabMembersNameEn, inputLabMembersAdmissionYear, inputLabMembersEmail, "
					+ "inputLabMembersGroup, inputLabMembersEtc, inputLabMembersEditdate, inputLabMembersEditRightIndex, inputDepartmentProfessorNo"
					+ ") values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
			pstmt.setInt(1, inputLabMembersCode);
			pstmt.setString(2, inputLabMembersPicture);
			pstmt.setString(3, inputLabMembersNameKo);
			pstmt.setString(4, inputLabMembersNameEn);
			pstmt.setString(5, inputLabMembersAdmissionYear);
			pstmt.setString(6, inputLabMembersEmail);
			pstmt.setInt(7, inputLabMembersGroup);
			pstmt.setString(8, inputLabMembersEtc);
			pstmt.setLong(9, inputLabMembersEditdate);
			pstmt.setInt(10, inputLabMembersEditRightIndex);
			pstmt.setInt(11, inputDepartmentProfessorNo);
			pstmt.executeUpdate();
			
			return true;
			
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
	
	// 수정요망
	public static boolean modifyLabMembers(int inputLabMembersCode, String inputLabMembersPicture, String inputLabMembersNameKo,
			String inputLabMembersNameEn, String inputLabMembersAdmissionYear, int inputLabMembersGroup, 
			String inputLabMembersEtc, long inputLabMembersEditdate ,int inputLabMembersEditRightIndex, int inputDepartmentProfessorNo,String inputLabMembersEmail) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("UPDATE dksw_lab_members SET "
					+ "inputLabMembersCode = ?, inputLabMembersPicture = ?, inputLabMembersNameKo = ?, inputLabMembersNameEn = ?, inputLabMembersAdmissionYear = ?, "
					+ "inputLabMembersGroup = ?, inputLabMembersEtc = ?, inputLabMembersEditdate, inputLabMembersEditRightIndex, inputDepartmentProfessorNo = ? WHERE inputLabMembersEmail = ? ");
		
			pstmt.setInt(1, inputLabMembersCode);
			pstmt.setString(2, inputLabMembersPicture);
			pstmt.setString(3, inputLabMembersNameKo);
			pstmt.setString(4, inputLabMembersNameEn);
			pstmt.setString(5, inputLabMembersAdmissionYear);
			pstmt.setInt(6, inputLabMembersGroup);
			pstmt.setString(7, inputLabMembersEtc);
			pstmt.setLong(8, inputLabMembersEditdate);
			pstmt.setInt(9, inputLabMembersEditRightIndex);
			pstmt.setInt(10, inputDepartmentProfessorNo);
			pstmt.setString(11, inputLabMembersEmail);
			pstmt.executeUpdate();
			
			return true;
			
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
	
	// 수정요망
	public static boolean deleteLabMembers(String inputLabMembersEmail) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int deleteQueryCount = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("DELETE FROM dksw_lab_members WHERE inputLabMembersEmail = ?");
			pstmt.setString(1, inputLabMembersEmail);
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

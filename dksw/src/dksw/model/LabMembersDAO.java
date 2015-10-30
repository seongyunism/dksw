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
						rset.getInt(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6),
						rset.getString(7),
						rset.getString(8),
						rset.getString(9),
						rset.getInt(10)
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
	
	//새로운 값 삽입
		public static boolean writeRecord(int inputLabCode, String inputLabData1, String inputLabData2, String inputLabData3,String inputLabData4, String inputLabData5) throws SQLException {

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
		
			int writeQueryCount = 0;
			
			try {
				con = DBUtil.getConnection();

				pstmt = con.prepareStatement("INSERT INTO dksw_lab_members(dkswLabCode, dkswLabMembersNameKo, dkswLabMembersNameEn, dkswLabMembersAdmissionYear,dkswLabMembersEmail,dkswLabMembersWorkPlace) values(?, ?, ?, ?, ?, ?)");
									
				pstmt.setInt(1, inputLabCode);
				pstmt.setString(2, inputLabData1);
				pstmt.setString(3, inputLabData2);
				pstmt.setString(4, inputLabData3);
				pstmt.setString(5, inputLabData4);
				pstmt.setString(6, inputLabData5);
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
				pstmt = con.prepareStatement("DELETE FROM dksw_lab_members WHERE dkswLabMembersNo=?");
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

package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dksw.model.domain.Member;
import dksw.util.DBUtil;

public class MemberDAO {

	public static boolean checkOfflineAuthCode(String inputOfflineAuthCode) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		boolean checkOfflineAuthCode = false;
		String nowOfflineAuthCode = "";
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT dkswMemberOfflineAuthCode FROM dksw_member_code ORDER BY dkswMemberOfflineAuthYear DESC, dkswMemberOfflineAuthMonth DESC LIMIT 1");
			rset = pstmt.executeQuery();
			
			rset.next();
			nowOfflineAuthCode = rset.getString(1);

			if(inputOfflineAuthCode.equals(nowOfflineAuthCode)) {
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

	public static boolean checkJoinMember(int inputMemberCategory, String inputMemberEmail, String inputMemberPassword,
			String inputMemberStudentNo, String inputMemberName, int inputMemberSNS, int inputMemberOnlineAuth, 
			String inputMemberOnlineAuthCode, String inputMemberOfflineAuthCode, int inputMemberJoinDate, int inputMemberAdminAuth) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_member("
					+ "dkswMemberCategory, dkswMemberEmail, dkswMemberPassword, dkswMemberStudentNo, dkswMemberName, dkswMemberSNS, "
					+ "dkswMemberOnlineAuth, dkswMemberOnlineAuthCode, dkswMemberOfflineAuthCode, dkswMemberJoinDate, dkswMemberAdminAuth"
					+ ") values(?, ?, password(?), ?, ?, ?, ?, ?, ?, ?, ?)");
		
			pstmt.setInt(1, inputMemberCategory);
			pstmt.setString(2, inputMemberEmail);
			pstmt.setString(3, inputMemberPassword);
			pstmt.setString(4, inputMemberStudentNo);
			pstmt.setString(5, inputMemberName);
			pstmt.setInt(6, inputMemberSNS);
			pstmt.setInt(7,  inputMemberOnlineAuth);
			pstmt.setString(8,  inputMemberOnlineAuthCode);
			pstmt.setString(9,  inputMemberOfflineAuthCode);
			pstmt.setInt(10, inputMemberJoinDate);
			pstmt.setInt(11,  inputMemberAdminAuth);
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


}

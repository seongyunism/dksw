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

}

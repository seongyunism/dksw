package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dksw.util.DBUtil;

public class MemberSNSDAO {

	public static int checkMemberSNS(int inputMemberSNSCategory, String inputMemberSNSId) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int memberNo = 0;
		
		try {
			con = DBUtil.getConnection();
		
			pstmt = con.prepareStatement("SELECT dkswMemberNo FROM dksw_member_sns WHERE dkswMemberSNSCategory=? AND dkswMemberSNSId=?");
			pstmt.setInt(1, inputMemberSNSCategory);
			pstmt.setString(2, inputMemberSNSId);
			rset = pstmt.executeQuery();
			
            if(rset.next()) {
            	memberNo = rset.getInt(1);            	
            }
			
            return memberNo;
			
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

package dksw.mobile.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dksw.mobile.model.domain.Member;
import dksw.mobile.util.DBUtil;

public class MemberDAO {

	public static Member getMember(int inputMemberNo) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member thisMember = null;
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_member WHERE dkswMemberNo=?");
			pstmt.setInt(1, inputMemberNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				thisMember = new Member(
					rset.getInt(1),
					rset.getInt(2),
					rset.getString(3),
					rset.getString(4),
					rset.getString(5),
					rset.getString(6),
					rset.getInt(7),
					rset.getInt(8),
					rset.getString(9),
					rset.getString(10),
					rset.getLong(11),
					rset.getInt(12)
				);
			}

			return thisMember;
			
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
	
	public static Member checkLoginMember(String inputMemberEmail, String inputMemberPassword) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int memberNo = 0;
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT dkswMemberNo FROM dksw_member WHERE dkswMemberEmail=? AND dkswMemberPassword=password(?)");
			pstmt.setString(1, inputMemberEmail);
			pstmt.setString(2, inputMemberPassword);
			rset = pstmt.executeQuery();
			
			rset.next();
			memberNo = rset.getInt(1);
			
			if(memberNo > 0) {
				return getMember(memberNo);
			} else {
				return null;
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

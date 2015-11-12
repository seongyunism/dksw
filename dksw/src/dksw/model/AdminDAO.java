package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dksw.model.domain.AdminPermission;
import dksw.util.DBUtil;

public class AdminDAO {

	public static AdminPermission getPermission(String inputMenuName) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		AdminPermission ap = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_admin_permission WHERE dkswMenuNo=?");
			pstmt.setInt(1, getMenuNo(inputMenuName));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ap = new AdminPermission(
					rset.getString(1),
					rset.getLong(2),
					rset.getString(3),
					rset.getString(4)
				);
			}

			return ap;
			
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
	
	public static int getMenuNo(String inputAdminMenuName) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int outputAdminMenuNo = 0;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT dkswAdminMenuNo FROM dksw_admin_menu WHERE dkswAdminMenuName=?");
			pstmt.setString(1, inputAdminMenuName);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				outputAdminMenuNo = rset.getInt(1);
			}

			return outputAdminMenuNo;
			
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
	
	public static boolean addPushLog(long inputAdminPushDate, String inputAdminPushMsg, int inputMemberNo) throws SQLException {
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int check = 0;
		
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("INSERT INTO dksw_admin_push(dkswAdminPushDate, dkswAdminPushMsg, dkswMemberNo) VALUES(?, ?, ?)");
			pstmt.setLong(1, inputAdminPushDate);
			pstmt.setString(2, inputAdminPushMsg);
			pstmt.setInt(3,  inputMemberNo);
			check = pstmt.executeUpdate();
			
			if(check == 1) {
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

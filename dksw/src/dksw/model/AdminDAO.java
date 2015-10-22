package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dksw.model.domain.AdminPermission;
import dksw.util.DBUtil;

public class AdminDAO {

	public static AdminPermission getPermission(String inputAdminPermissionId) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		AdminPermission ap = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_admin_permission WHERE dkswAdminPermissionId=?");
			pstmt.setString(1, inputAdminPermissionId);
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
}

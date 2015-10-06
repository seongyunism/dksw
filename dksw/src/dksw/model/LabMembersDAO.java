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
			pstmt = con.prepareStatement("SELECT * FROM dksw_lab_members WHERE dkswLabCode=? AND NOT dkswLabMembersGroup=1");
			pstmt.setInt(1, inputLabCode);
			rset = pstmt.executeQuery();
				
			while (rset.next()) {
				member = new LabMembers(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6),
						rset.getInt(7),
						rset.getString(8),
						rset.getInt(9),
						rset.getInt(10),
						rset.getInt(11)
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
}

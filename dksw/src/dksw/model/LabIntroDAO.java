package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dksw.model.domain.LabIntro;
import dksw.util.DBUtil;

public class LabIntroDAO {

	public static LabIntro getLabIntro(int inputLabCode) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		LabIntro data = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_lab_intro WHERE dkswLabCode=?");
			pstmt.setInt(1, inputLabCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				data = new LabIntro(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getInt(4),
						rset.getInt(5)
				);
			}

			return data;
			
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

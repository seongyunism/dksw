package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.LabPaper;
import dksw.util.DBUtil;

public class LabPaperDAO {

	public static ArrayList<LabPaper> getLabPaper(int inputLabCode) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<LabPaper> papers = new ArrayList<LabPaper>();
		LabPaper paper = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_lab_paper WHERE dkswLabCode=?");
			pstmt.setInt(1, inputLabCode);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				paper = new LabPaper(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getString(4),
						rset.getInt(5),
						rset.getInt(6)
				);
				papers.add(paper);
			}

			return papers;
			
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

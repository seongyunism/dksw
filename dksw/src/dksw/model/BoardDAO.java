package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.Board;
import dksw.model.domain.DepartmentGreeting;
import dksw.model.domain.LabMembers;
import dksw.util.DBUtil;

public class BoardDAO {

	public static ArrayList<Board> getBoard(int inputBoardCategory) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Board> list = new ArrayList<Board>();
		Board data = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_board WHERE dkswBoardCategory=?  ORDER BY dkswBoardNO DESC LIMIT 10");
			pstmt.setInt(1,  inputBoardCategory);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				data = new Board(
						rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getInt(4),
						rset.getInt(5),
						rset.getInt(6),
						rset.getString(7),
						rset.getString(8)
				);
				
				list.add(data);
			}

			return list;
			
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

	
	
	public static Board getPost(int inputBoardNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Board data = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_board WHERE dkswBoardNo=?");
			pstmt.setInt(1,  inputBoardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				data = new Board(
						rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getInt(4),
						rset.getInt(5),
						rset.getInt(6),
						rset.getString(7),
						rset.getString(8)
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

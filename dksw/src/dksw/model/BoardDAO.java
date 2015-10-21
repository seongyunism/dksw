package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.Board;
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
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_board WHERE dkswBoardCategory=? ORDER BY dkswBoardNo DESC LIMIT 20");
			pstmt.setInt(1,  inputBoardCategory);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				data = new Board(
						rset.getInt(1),
						rset.getInt(2),
						rset.getInt(3),
						rset.getInt(4),
						rset.getInt(5),
						rset.getString(6),
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
						rset.getInt(3),
						rset.getInt(4),
						rset.getInt(5),
						rset.getString(6),
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

	public static boolean writePost(int inputBoardCategory, int inputMemberNo, long inputBoardWriteDate,
			int inputBoardReadnum, String inputBoardTitle, String inputBoardContent, String inputBoardPicture) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_board("
					+ "dkswBoardCategory, dkswMemberNo, dkswBoardWriteDate, dkswBoardReadnum, dkswBoardTitle, dkswBoardContent, "
					+ "dkswBoardPicture"
					+ ") values(?, ?, ?, ?, ?, ?, ?)");
		
			pstmt.setInt(1, inputBoardCategory);
			pstmt.setInt(2, inputMemberNo);
			pstmt.setLong(3, inputBoardWriteDate);
			pstmt.setInt(4, inputBoardReadnum);
			pstmt.setString(5, inputBoardTitle);
			pstmt.setString(6, inputBoardContent);
			pstmt.setString(7, inputBoardPicture);
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
	
	public static boolean modifyPost(int inputBoardNo, int inputBoardCategory, String inputBoardTitle, String inputBoardContent) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("UPDATE dksw_board SET dkswBoardCategory=?, dkswBoardTitle=?, dkswBoardContent=? WHERE dkswBoardNo=?");
			pstmt.setInt(1, inputBoardCategory);
			pstmt.setString(2, inputBoardTitle);
			pstmt.setString(3, inputBoardContent);
			pstmt.setInt(4, inputBoardNo);
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

	public static boolean deletePost(int inputBoardNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int deleteQueryCount = 0;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("DELETE FROM dksw_board WHERE dkswBoardNo=?");
			pstmt.setInt(1, inputBoardNo);
			deleteQueryCount = pstmt.executeUpdate();

			if(deleteQueryCount == 1) {
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

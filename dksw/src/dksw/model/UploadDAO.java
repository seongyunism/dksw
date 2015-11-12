package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dksw.util.DBUtil;

public class UploadDAO {

	public static int addUploadFile(int inputUploadCategory, int inputUploadPostNo, long inputUploadDate, int inputMemberNo,
			String inputUploadFileName, String inputUploadFileSrc) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int check = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_upload("
					+ "dkswUploadCategory, dkswUploadPostNo, dkswUploadDate, dkswMemberNo, dkswUploadFileName, dkswUploadFileSrc"
					+ ") values(?, ?, ?, ?, ?, ?)");
		
			pstmt.setInt(1, inputUploadCategory);
			pstmt.setInt(2, inputMemberNo);
			pstmt.setLong(3, inputUploadDate);
			pstmt.setInt(4, inputMemberNo);
			pstmt.setString(5, inputUploadFileName);
			pstmt.setString(6, inputUploadFileSrc);
			check = pstmt.executeUpdate();

			return check;
						
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
	
	public static int getNextUploadNo() throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int nextPostNo = 0;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("SELECT max(dkswUploadNo) FROM dksw_upload");
			rset = pstmt.executeQuery();
			
			rset.next();
			nextPostNo = rset.getInt(1) + 1;
			
			return nextPostNo;
			
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

	public static String getFileSrc(int inputUploadNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String fileSrc = null;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("SELECT dkswUploadFileSrc FROM dksw_upload WHERE dkswUploadNo=?");
			pstmt.setInt(1, inputUploadNo);
			rset = pstmt.executeQuery();
			
			rset.next();
			fileSrc = rset.getString(1);
			
			return fileSrc;
		
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
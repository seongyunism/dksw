package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.Member;
import dksw.util.DBUtil;

public class MemberDAO {

	public static boolean checkRedundancyEmail(String inputMemberEmail) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT count(*) FROM dksw_member WHERE dkswMemberEmail=?");
			pstmt.setString(1, inputMemberEmail);
			rset = pstmt.executeQuery();
			
			rset.next();
			if(rset.getInt(1) == 0) {
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

	public static boolean checkOfflineAuthCode(String inputOfflineAuthCode) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String nowOfflineAuthCode = "";
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement("SELECT dkswMemberOfflineAuthCode FROM dksw_member_code ORDER BY dkswMemberOfflineAuthYear DESC, dkswMemberOfflineAuthMonth DESC LIMIT 1");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nowOfflineAuthCode = rset.getString(1);
			}

			if(inputOfflineAuthCode.equals(nowOfflineAuthCode)) {
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

	public static boolean checkJoinMember(int inputMemberCategory, String inputMemberEmail, String inputMemberPassword,
			String inputMemberStudentNo, String inputMemberName, int inputMemberSNS, int inputMemberOnlineAuth, 
			String inputMemberOnlineAuthCode, String inputMemberOfflineAuthCode, long inputMemberJoinDate, int inputMemberAdminAuth) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_member("
					+ "dkswMemberCategory, dkswMemberEmail, dkswMemberPassword, dkswMemberStudentNo, dkswMemberName, dkswMemberSNS, "
					+ "dkswMemberOnlineAuth, dkswMemberOnlineAuthCode, dkswMemberOfflineAuthCode, dkswMemberJoinDate, dkswMemberAdminAuth"
					+ ") values(?, ?, password(?), ?, ?, ?, ?, ?, ?, ?, ?)");
		
			pstmt.setInt(1, inputMemberCategory);
			pstmt.setString(2, inputMemberEmail);
			pstmt.setString(3, inputMemberPassword);
			pstmt.setString(4, inputMemberStudentNo);
			pstmt.setString(5, inputMemberName);
			pstmt.setInt(6, inputMemberSNS);
			pstmt.setInt(7, inputMemberOnlineAuth);
			pstmt.setString(8, inputMemberOnlineAuthCode);
			pstmt.setString(9, inputMemberOfflineAuthCode);
			pstmt.setLong(10, inputMemberJoinDate);
			pstmt.setInt(11, inputMemberAdminAuth);
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

	public static int searchOnlineAuthCode(String inputMemberOnlineAuthCode) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int memberNo = 0;
		int memberOnlineAuth = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT dkswMemberNo, dkswMemberOnlineAuth FROM dksw_member WHERE dkswMemberOnlineAuthCode=?");
			pstmt.setString(1, inputMemberOnlineAuthCode); 
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberNo = rset.getInt(1);
				memberOnlineAuth = rset.getInt(2);
			}
			
			if(memberOnlineAuth == 1) {
				return -1;
			} else {
				return memberNo;
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
	
	public static boolean checkOnlineAuthCode(String inputMemberOnlineAuthCode, int inputMemberAdminAuth) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("UPDATE dksw_member SET dkswMemberOnlineAuth=1, dkswMemberAdminAuth=? WHERE dkswMemberOnlineAuthCode=?");
			pstmt.setInt(1, inputMemberAdminAuth);
			pstmt.setString(2, inputMemberOnlineAuthCode); 
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
			
			pstmt = con.prepareStatement("SELECT dkswMemberNo FROM dksw_member WHERE dkswMemberEmail=? AND dkswMemberPassword=password(?) AND dkswMemberOnlineAuth=1 AND dkswMemberAdminAuth=1");
			pstmt.setString(1, inputMemberEmail);
			pstmt.setString(2, inputMemberPassword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberNo = rset.getInt(1);
			}
			
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

	public static ArrayList<Integer> getSameCategoryMembers(int inputMemberCategory) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Integer> members = new ArrayList<Integer>();
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT dkswMemberNo FROM dksw_member WHERE dkswMemberCategory=?");
			pstmt.setInt(1, inputMemberCategory);
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				members.add(rset.getInt(1));
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

	public static boolean modifyPassword(int inputMemberNo, String inputMemberPassword) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int check = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("UPDATE dksw_Member SET dkswMemberPassword=password(?) WHERE dkswMemberNo=?");				

			pstmt.setString(1, inputMemberPassword);
			pstmt.setInt(2, inputMemberNo);
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
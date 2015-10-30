package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.DepartmentClub;
import dksw.model.domain.DepartmentContact;
import dksw.model.domain.DepartmentGreeting;
import dksw.model.domain.DepartmentHistory;
import dksw.model.domain.DepartmentIntro;
import dksw.model.domain.DepartmentProfessor;
import dksw.util.DBUtil;

public class DepartmentDAO {
	
	// 학과 소개
	public static DepartmentIntro getIntro() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		DepartmentIntro data = null;
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_intro");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				data = new DepartmentIntro(
						rset.getString(1),
						rset.getInt(2),
						rset.getInt(3)
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

	// 학과장 인사
	public static DepartmentGreeting getGreeting() throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		DepartmentGreeting data = null;
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_greeting");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				data = new DepartmentGreeting(
						rset.getString(1),
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
	
	// 학과 연혁
	public static ArrayList<DepartmentHistory> getHistory() throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<DepartmentHistory> datas = new ArrayList<>();
		DepartmentHistory data = null;
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_history WHERE NOT dkswDepartmentHistoryVisible=0 ORDER BY dkswDepartmentHistoryYear ASC, dkswDepartmentHistoryMonth ASC");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				data = new DepartmentHistory(
						rset.getInt(1),
						rset.getInt(2),
						rset.getInt(3),
						rset.getString(4),
						rset.getInt(5)
				);
				
				datas.add(data);
			}

			return datas;
			
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

	// 학과 교수 가져오기 (교수 테이블 인덱스)
	public static DepartmentProfessor getProfessorByProfessorNo(int inputDepartmentProfessorNo) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		DepartmentProfessor data = null;	
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_professor WHERE dkswDepartmentProfessorNo=?");
			pstmt.setInt(1, inputDepartmentProfessorNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				data = new DepartmentProfessor(
					rset.getInt(1),
					rset.getString(2),
					rset.getString(3),
					rset.getString(4),
					rset.getString(5),
					rset.getString(6),
					rset.getString(7),
					rset.getString(8),
					rset.getString(9),
					rset.getString(10),
					rset.getInt(11)
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
	
	// 학과 교수 가져오기 (회원 테이블 인덱스)
	public static DepartmentProfessor getProfessor(int inputMemberNo) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		DepartmentProfessor data = null;	
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_professor WHERE dkswMemberNo=?");
			pstmt.setInt(1, inputMemberNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				data = new DepartmentProfessor(
					rset.getInt(1),
					rset.getString(2),
					rset.getString(3),
					rset.getString(4),
					rset.getString(5),
					rset.getString(6),
					rset.getString(7),
					rset.getString(8),
					rset.getString(9),
					rset.getString(10),
					rset.getInt(11)
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
	
	// 학과 교수 
	public static ArrayList<DepartmentProfessor> getProfessorList() throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<DepartmentProfessor> datas = new ArrayList<>();
		DepartmentProfessor data = null;
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_professor ");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				data = new DepartmentProfessor(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6),
						rset.getString(7),
						rset.getString(8),
						rset.getString(9),
						rset.getString(10),
						rset.getInt(11)
				);
				
				datas.add(data);
			}
			
			return datas;
			
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
	
	// 동아리 소개
	public static DepartmentClub getClub(int inputClubCode) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		DepartmentClub data = null;
		
		try {
			con = DBUtil.getConnection(); 
					
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_club WHERE dkswDepartmentClubNo=?");
			pstmt.setInt(1, inputClubCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				data = new DepartmentClub(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getInt(6),
						rset.getInt(7)
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
	
	//학과 위치 및 연락처  
	public static DepartmentContact getContact() throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		DepartmentContact data = null;
		
		try {
			con = DBUtil.getConnection(); 
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_contact");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				data = new DepartmentContact(
						rset.getString(1),
						rset.getString(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6)
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
	
	// 연혁 삽입
	public static boolean writeRecord(int inputDepartmentData1, int inputDepartmentData2, String inputDepartmentData3) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		int writeQueryCount = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_department_history(dkswDepartmentHistoryYear, dkswDepartmentHistoryMonth, dkswDepartmentHistoryContent) values(?, ?, ?)");
			pstmt.setInt(1, inputDepartmentData1);
			pstmt.setInt(2, inputDepartmentData2);
			pstmt.setString(3, inputDepartmentData3);
			writeQueryCount = pstmt.executeUpdate();
			
			if(writeQueryCount == 1) {
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
	//연혁 삭제 
	public static boolean deleteRecord(int inputDepartmentData1) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
			
		int deleteQueryCount = 0;
			
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("DELETE FROM dksw_department_history WHERE dkswDepartmentHistoryNo=?");
			pstmt.setInt(1, inputDepartmentData1);
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
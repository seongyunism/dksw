package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.DepartmentContact;
import dksw.model.domain.DepartmentGreeting;
import dksw.model.domain.DepartmentHistory;
import dksw.model.domain.DepartmentProfessor;
import dksw.util.DBUtil;

public class DepartmentDAO {

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
						rset.getString(3),
						rset.getInt(4)
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

	// 학과 교수
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
	
}
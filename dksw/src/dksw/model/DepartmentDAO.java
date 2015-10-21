package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.DepartmentGreeting;
import dksw.model.domain.DepartmentHistory;
import dksw.model.domain.DepartmentProfessor;
import dksw.util.DBUtil;

public class DepartmentDAO {

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
	//학과 교수 
	public static ArrayList<DepartmentProfessor> getProfessor() throws SQLException {

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
						rset.getInt(11),
						rset.getInt(12)
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
	
}
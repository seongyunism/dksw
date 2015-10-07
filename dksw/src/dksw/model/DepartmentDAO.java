package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.DepartmentGreeting;
import dksw.model.domain.DepartmentHistory;
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
			
			pstmt = con.prepareStatement("SELECT * FROM dksw_department_history");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				data = new DepartmentHistory(
						rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getInt(4),
						rset.getInt(5),
						rset.getInt(6)
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
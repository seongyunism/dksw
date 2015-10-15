package dksw.mobile.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

	public static Connection getConnection() {

		// 보안상 취약하므로 추후 수정 필수!!
		
		final String url = "jdbc:mysql://890313.com:3306/dksw";
		final String id = "dksw";
		final String password = "whdgkqtjfrP1";
		
		Connection con = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("드라이버를 찾음");
			
			con = DriverManager.getConnection(url, id, password);
			System.out.println("DB 연결 성공");

			return con;
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾지 못함");
			
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
		}		return null;
	}
	
	public static void close(Connection conn, Statement stmt) throws SQLException{		
		if(stmt!= null){
			stmt.close();
		}
		if(conn != null){
			conn.close();
		}
	}
	
	public static void close(Connection conn, Statement stmt, ResultSet rset) throws SQLException{
		if(rset != null){
			rset.close();
			rset = null;
		}
		if(stmt != null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
}
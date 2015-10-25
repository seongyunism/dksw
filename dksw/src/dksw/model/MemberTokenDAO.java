package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dksw.util.DBUtil;

public class MemberTokenDAO {

    public static boolean checkMemberToken(int inputMemberNo, int inputMemberTokenDevice, long inputMemberTokenDate, String inputMemberTokenKey) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        int check = 0;

        try {
            con = DBUtil.getConnection();

            pstmt = con.prepareStatement("SELECT count(*) FROM dksw_member_token WHERE dkswMemberNo=?");
            pstmt.setInt(1, inputMemberNo);
            rset = pstmt.executeQuery();

            rset.next();
            
            if(rset.getInt(1) == 1) { // Update문 실행
                pstmt = con.prepareStatement("UPDATE dksw_member_token SET dkswMemberTokenDevice=?, dkswMemberTokenDate=?, dkswMemberTokenKey=? WHERE dkswMemberNo=?");
                pstmt.setInt(1, inputMemberTokenDevice);
                pstmt.setLong(2, inputMemberTokenDate);
                pstmt.setString(3, inputMemberTokenKey);
                pstmt.setInt(4, inputMemberNo);
                check = pstmt.executeUpdate();

            } else { // INSERT문 실행
                pstmt = con.prepareStatement("INSERT INTO dksw_member_token(dkswMemberNo, dkswMemberTokenDevice, dkswMemberTokenDate, dkswMemberTokenKey) VALUES(?, ?, ?, ?)");
                pstmt.setInt(1, inputMemberNo);
                pstmt.setInt(2, inputMemberTokenDevice);
                pstmt.setLong(3, inputMemberTokenDate);
                pstmt.setString(4, inputMemberTokenKey);
                check = pstmt.executeUpdate();
            }

            if(check == 1) {
                return true;
            } else {
                return false;
            }

        } catch(SQLException se) {
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

	public static String getMemberToken(int inputMemberNo) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
		
        String key = "";

        try {
            con = DBUtil.getConnection();

            pstmt = con.prepareStatement("SELECT dkswMemberTokenKey FROM dksw_member_token WHERE dkswMemberNo=?");
            pstmt.setInt(1, inputMemberNo);
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
            	key = rset.getString(1);            	
            }
		
            return key;
		
        } catch(SQLException se) {
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

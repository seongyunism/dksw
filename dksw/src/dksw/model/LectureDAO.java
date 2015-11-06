package dksw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dksw.model.domain.LabAchievements;
import dksw.model.domain.Lecture;
import dksw.model.domain.LectureChapter;
import dksw.model.domain.LectureRegister;
import dksw.util.DBUtil;

public class LectureDAO {

	public static boolean addLecture(int inputLectureYear, int inputLectureSemester, String inputLectureName, int dkswDepartmentProfessorNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int check = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_lecture(dkswLectureYear, dkswLectureSemester, dkswLectureName, dkswDepartmentProfessorNo) values(?, ?, ?, ?)");
			pstmt.setInt(1, inputLectureYear);
			pstmt.setInt(2, inputLectureSemester);
			pstmt.setString(3, inputLectureName);
			pstmt.setInt(4, dkswDepartmentProfessorNo);
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


	public static ArrayList<Lecture> getLectureList(int inputMemberNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Lecture> lectures = new ArrayList<Lecture>();
		Lecture lecture = null;

		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT * FROM dksw_lecture AS L WHERE NOT L.dkswLectureNo=ANY(SELECT R.dkswLectureNo FROM dksw_lecture_register AS R WHERE dkswMemberNo=?) ORDER BY dkswLectureYear DESC, dkswLectureSemester DESC");
			pstmt.setInt(1, inputMemberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				lecture = new Lecture(
						rset.getInt(1),
						rset.getInt(2),
						rset.getInt(3),
						rset.getString(4),
						rset.getInt(5)
				);
				
				lectures.add(lecture);
			}
			
			return lectures;
		
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
	
	public static ArrayList<Lecture> getLectureListByProfessor(int inputDepartmentProfessorNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Lecture> lectures = new ArrayList<Lecture>();
		Lecture lecture = null;

		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT * FROM dksw_lecture WHERE dkswDepartmentProfessorNo=? ORDER BY dkswLectureYear DESC, dkswLectureSemester DESC");
			pstmt.setInt(1, inputDepartmentProfessorNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				lecture = new Lecture(
						rset.getInt(1),
						rset.getInt(2),
						rset.getInt(3),
						rset.getString(4),
						rset.getInt(5)
				);
				
				lectures.add(lecture);
			}
			
			return lectures;
		
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
	
	public static ArrayList<Lecture> getLectureListByStudent(int inputMemberNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Lecture> lectures = new ArrayList<Lecture>();
		Lecture lecture = null;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT * FROM dksw_lecture AS L WHERE L.dkswLectureNo=ANY(SELECT R.dkswLectureNo FROM dksw_lecture_register AS R WHERE dkswMemberNo=?)");
			pstmt.setInt(1, inputMemberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {	
				lecture = new Lecture(
					rset.getInt(1),
					rset.getInt(2),
					rset.getInt(3),
					rset.getString(4),
					rset.getInt(5)
				);
				lectures.add(lecture);
			}
							
			return lectures;
		
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
	
	
	public static ArrayList<LectureChapter> getLectureChapterList(int inputLectureNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<LectureChapter> chapters = new ArrayList<LectureChapter>();
		LectureChapter chapter = null;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("SELECT * FROM dksw_lecture_chapter WHERE dkswLectureNo=? ORDER BY dkswLectureChapterCount ASC");
			pstmt.setInt(1, inputLectureNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				chapter = new LectureChapter(
					rset.getInt(1),
					rset.getInt(2),
					rset.getInt(3),
					rset.getInt(4),
					rset.getString(5),
					rset.getInt(6),
					rset.getInt(7),
					rset.getInt(8)
				);
				
				chapters.add(chapter);
			}
			
			return chapters;
		
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

	public static boolean checkRegisterLecture(int inputLectureNo, int inputMemberNo) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        try {
            con = DBUtil.getConnection();

            pstmt = con.prepareStatement("SELECT count(*) FROM dksw_lecture_register WHERE dkswLectureNo=? AND dkswMemberNo=?");
			pstmt.setInt(1, inputLectureNo);
			pstmt.setInt(2, inputMemberNo);
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
	
	public static boolean addRegisterLecture(int inputLectureNo, int inputMemberNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int check = 0;
		
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("INSERT INTO dksw_lecture_register(dkswLectureNo, dkswMemberNo) values(?, ?)");
			pstmt.setInt(1, inputLectureNo);
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

	public static boolean cancelRegisterLecture(int inputLectureNo, int inputMemberNo) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int check = 0;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("DELETE FROM dksw_lecture_register WHERE dkswLectureNo=? AND dkswMemberNo=?");
			pstmt.setInt(1, inputLectureNo);
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


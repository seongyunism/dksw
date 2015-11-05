package dksw.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dksw.model.DepartmentDAO;
import dksw.model.LectureDAO;
import dksw.model.domain.DepartmentProfessor;
import dksw.model.domain.Lecture;
import dksw.model.domain.LectureChapter;

public class LectureController extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		
		if(action.equals("addLecture")) {
			addLecture(req, res);
		} else if(action.equals("getLectureListByProfessor")) {
			getLectureList(req, res);
		} else if(action.equals("getLectureList")) {
			getLectureListByStudent(req, res);
		} else if(action.equals("registerLecture")) {
			registerLecture(req, res);
		}
	}

	private void addLecture(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		boolean checkAddLecture = false;
		DepartmentProfessor professor = null;
		HttpSession sessionMember = req.getSession();
		
		try {
			int inputLectureYear = (req.getParameter("inputLectureYear") != null) ? Integer.parseInt(req.getParameter("inputLectureYear")) : null;	
			int inputLectureSemester = (req.getParameter("inputLectureSemester") != null) ? Integer.parseInt(req.getParameter("inputLectureSemester")) : null;
			String inputLectureName = (req.getParameter("inputLectureName") != null) ? (req.getParameter("inputLectureName")) : null;
			int inputLectureCount = (req.getParameter("inputLectureCount") != null) ? Integer.parseInt(req.getParameter("inputLectureCount")) : null;
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
			
			if(memberCategory == 6) { // 교수인지 확인
				professor = DepartmentDAO.getProfessor(Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString()));
				
				// DB 삽입
				checkAddLecture = LectureDAO.addLecture(inputLectureYear, inputLectureSemester, inputLectureName, inputLectureCount, professor.getDkswDepartmentProfessorNo());
				
				if(checkAddLecture) {
					res.getWriter().write("AddOK");
				} else {
					res.getWriter().write("Fail");
				}
			} else {
				res.getWriter().write("NoProfessor");
			}
			
				
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	private void getLectureList(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		DepartmentProfessor professor = null;
		HttpSession sessionMember = req.getSession();
		ArrayList<Lecture> lectures = new ArrayList<Lecture>();
		ArrayList<LectureChapter> chapters = new ArrayList<LectureChapter>();
		
		try {
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
	
			if(memberCategory == 6) { // 교수인지 확인
				professor = DepartmentDAO.getProfessor(Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString()));
				
				lectures = LectureDAO.getLectureList(professor.getDkswDepartmentProfessorNo());

				JSONObject jObject = new JSONObject();
				JSONArray jLectureArray = new JSONArray();
				
				for(int i=0; i<lectures.size(); i++) { // 강의
					chapters = LectureDAO.getLectureChapterList(lectures.get(i).getDkswLectureNo(), professor.getDkswDepartmentProfessorNo());

					JSONObject tempLecture = new JSONObject();
					JSONArray jChapterArray = new JSONArray();
					
					tempLecture.put("dkswLectureNo", lectures.get(i).getDkswLectureNo());
					tempLecture.put("dkswLectureName", lectures.get(i).getDkswLectureName());
					tempLecture.put("dkswLectureYear", lectures.get(i).getDkswLectureYear());
					tempLecture.put("dkswLectureSemester", lectures.get(i).getDkswLectureSemester());
					tempLecture.put("dkswLectureCount", lectures.get(i).getDkswLectureCount());

					for(int j=0; j<chapters.size(); j++) { // 챕터
						JSONObject tempChapter = new JSONObject();

						tempChapter.put("dkswLectureChapterNo", chapters.get(j).getDkswLectureChapterNo());
						tempChapter.put("dkswLectureChapterCount", chapters.get(j).getDkswLectureChapterCount());
						tempChapter.put("dkswLectureChapterName", chapters.get(j).getDkswLectureChapterName());
						tempChapter.put("dkswLectureChapterVisible", chapters.get(j).getDkswLectureChapterVisible());
						tempChapter.put("dkswLectureChapterDownloadCount", chapters.get(j).getDkswLectureChapterDownloadCount());
						tempChapter.put("dkswLectureChapterDate", chapters.get(j).getDkswLectureChapterDate());
						jChapterArray.add(tempChapter);
					}
					
					tempLecture.put("dkswLectureChapters", jChapterArray);
					
					jLectureArray.add(tempLecture);
				}
			
				jObject.put("dkswLectureList", jLectureArray);
				
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");

				res.getWriter().write(jObject.toString());
			}

		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	private void getLectureListByStudent(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		HttpSession sessionMember = req.getSession();
		ArrayList<Lecture> lectures = new ArrayList<Lecture>();
		
		try {
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
	
			if(memberCategory == 7) { // 학생인지 확인
				
				lectures = LectureDAO.getLectureList();

				JSONObject jObject = new JSONObject();
				JSONArray jLectureArray = new JSONArray();
				
				for(int i=0; i<lectures.size(); i++) { // 강의
					JSONObject tempLecture = new JSONObject();
				
					tempLecture.put("dkswLectureNo", lectures.get(i).getDkswLectureNo());
					tempLecture.put("dkswLectureName", lectures.get(i).getDkswLectureName());
					tempLecture.put("dkswLectureYear", lectures.get(i).getDkswLectureYear());
					tempLecture.put("dkswLectureSemester", lectures.get(i).getDkswLectureSemester());
					tempLecture.put("dkswLectureCount", lectures.get(i).getDkswLectureCount());
					tempLecture.put("dkswLectureProfessorName", "교수 " + DepartmentDAO.getProfessorByProfessorNo(lectures.get(i).getDkswDepartmentProfessorNo()).getDkswDepartmentProfessorNameKo());
					jLectureArray.add(tempLecture);
				}

				jObject.put("dkswLectureList", jLectureArray);

				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");

				res.getWriter().write(jObject.toString());
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	private void registerLecture(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		HttpSession sessionMember = req.getSession();
		
		try {
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
			
			if(memberCategory == 7) { // 학생인지 확인
			
				int inputLectureNo = (req.getParameter("inputLectureNo") != null) ? Integer.parseInt(req.getParameter("inputLectureNo")) : null;	
				int inputLectureCount = (req.getParameter("inputLectureCount") != null) ? Integer.parseInt(req.getParameter("inputLectureCount")) : null;
			
				System.out.println(inputLectureCount);
				
			}	
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

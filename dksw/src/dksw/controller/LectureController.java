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
		} else if(action.equals("addRegisterLecture")) {
			addRegisterLecture(req, res);
		} else if(action.equals("getLectureListByProfessor")) {
			getLectureListByProfessor(req, res);
		} else if(action.equals("getLectureListByStudent")) {
			getLectureListByStudent(req, res);
		} else if(action.equals("getLectureList")) {
			getLectureList(req, res);
		} else if(action.equals("cancelRegisterLecture")) {
			cancelRegisterLecture(req, res);
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
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
			
			if(memberCategory == 6) { // 교수인지 확인
				professor = DepartmentDAO.getProfessor(Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString()));
				
				// DB 삽입
				checkAddLecture = LectureDAO.addLecture(inputLectureYear, inputLectureSemester, inputLectureName, professor.getDkswDepartmentProfessorNo());
				
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

	private void addRegisterLecture(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		HttpSession sessionMember = req.getSession();
		
		boolean checkRegisted = false;
		boolean checkRegisterLecture = false;
		
		try {
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
			int inputMemberNo = (sessionMember.getAttribute("dkswMemberNo") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberNo").toString())) : 0;			
			
			if(memberCategory == 7) { // 학생인지 확인
			
				int inputLectureNo = (req.getParameter("inputLectureNo") != null) ? Integer.parseInt(req.getParameter("inputLectureNo")) : null;	
			
				// 이미 수강한 학생인지 체크
				checkRegisted = LectureDAO.checkRegisterLecture(inputLectureNo, inputMemberNo);
				
				if(checkRegisted) {
					checkRegisterLecture = LectureDAO.addRegisterLecture(inputLectureNo, inputMemberNo);
					
					if(checkRegisterLecture) { // 등록 완료
						res.getWriter().write("RegisterOK");		
					} else { // DB 오류
						res.getWriter().write("Fail");		
					}	
				} else { // 같은 강의를 이미 수강신청한 회원
					res.getWriter().write("Already");	
				}
					
			} else { // 학생이 아니거나 회원이 아님
				res.getWriter().write("NoStudent");		
			}
					
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	private void getLectureListByProfessor(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		DepartmentProfessor professor = null;
		HttpSession sessionMember = req.getSession();
		ArrayList<Lecture> lectures = new ArrayList<Lecture>();
		ArrayList<LectureChapter> chapters = new ArrayList<LectureChapter>();
		
		try {
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
	
			if(memberCategory == 6) { // 교수인지 확인
				professor = DepartmentDAO.getProfessor(Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString()));
				
				lectures = LectureDAO.getLectureListByProfessor(professor.getDkswDepartmentProfessorNo());

				JSONObject jObject = new JSONObject();
				JSONArray jLectureArray = new JSONArray();
				
				for(int i=0; i<lectures.size(); i++) { // 강의
					chapters = LectureDAO.getLectureChapterList(lectures.get(i).getDkswLectureNo());

					JSONObject tempLecture = new JSONObject();
					JSONArray jChapterArray = new JSONArray();
					
					tempLecture.put("dkswLectureNo", lectures.get(i).getDkswLectureNo());
					tempLecture.put("dkswLectureName", lectures.get(i).getDkswLectureName());
					tempLecture.put("dkswLectureYear", lectures.get(i).getDkswLectureYear());
					tempLecture.put("dkswLectureSemester", lectures.get(i).getDkswLectureSemester());

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
		ArrayList<LectureChapter> chapters = new ArrayList<LectureChapter>();
		
		try {
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
	
			if(memberCategory == 7) { // 학생인지 확인
				// 학생이 수강하는 강의 가져오기
				lectures = LectureDAO.getLectureListByStudent(Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString()));

				JSONObject jObject = new JSONObject();
				JSONArray jLectureArray = new JSONArray();
				
				for(int i=0; i<lectures.size(); i++) { // 강의
					chapters = LectureDAO.getLectureChapterList(lectures.get(i).getDkswLectureNo());

					JSONObject tempLecture = new JSONObject();
					JSONArray jChapterArray = new JSONArray();
					
					tempLecture.put("dkswLectureNo", lectures.get(i).getDkswLectureNo());
					tempLecture.put("dkswLectureName", lectures.get(i).getDkswLectureName());
					tempLecture.put("dkswLectureYear", lectures.get(i).getDkswLectureYear());
					tempLecture.put("dkswLectureSemester", lectures.get(i).getDkswLectureSemester());
					tempLecture.put("dkswLectureProfessorName", "교수 " + DepartmentDAO.getProfessorByProfessorNo(lectures.get(i).getDkswDepartmentProfessorNo()).getDkswDepartmentProfessorNameKo());

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

	private void getLectureList(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		HttpSession sessionMember = req.getSession();
		ArrayList<Lecture> lectures = new ArrayList<Lecture>();
		
		try {
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
			int inputMemberNo = (sessionMember.getAttribute("dkswMemberNo") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberNo").toString())) : 0;	
			
			if(memberCategory == 7) { // 학생인지 확인
				lectures = LectureDAO.getLectureList(inputMemberNo);

				JSONObject jObject = new JSONObject();
				JSONArray jLectureArray = new JSONArray();
				
				for(int i=0; i<lectures.size(); i++) { // 강의
					JSONObject tempLecture = new JSONObject();
				
					tempLecture.put("dkswLectureNo", lectures.get(i).getDkswLectureNo());
					tempLecture.put("dkswLectureName", lectures.get(i).getDkswLectureName());
					tempLecture.put("dkswLectureYear", lectures.get(i).getDkswLectureYear());
					tempLecture.put("dkswLectureSemester", lectures.get(i).getDkswLectureSemester());
					tempLecture.put("dkswLectureProfessorName", "교수 " + DepartmentDAO.getProfessorByProfessorNo(lectures.get(i).getDkswDepartmentProfessorNo()).getDkswDepartmentProfessorNameKo());
					jLectureArray.add(tempLecture);
				}

				if(lectures.isEmpty()) {
					jObject.put("dkswLectureCountCheck", "false");
				} else {
					jObject.put("dkswLectureCountCheck", "true");
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
	
	private void cancelRegisterLecture(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		HttpSession sessionMember = req.getSession();
		boolean checkCancel = false;
		
		try {
			int memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberCategory").toString())) : 0;
			int inputLectureNo = (req.getParameter("inputLectureNo") != null) ? Integer.parseInt(req.getParameter("inputLectureNo")) : null;
			int inputMemberNo = (sessionMember.getAttribute("dkswMemberNo") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberNo").toString())) : 0;	
					
			if(memberCategory == 7) { // 학생인지 확인
				checkCancel = LectureDAO.cancelRegisterLecture(inputLectureNo, inputMemberNo);

				if(checkCancel) {
					res.getWriter().write("CancelOK");		
				} else {
					res.getWriter().write("Fail");		
				}
			
			} else {
				res.getWriter().write("Fail");		
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
}

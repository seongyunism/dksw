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

import dksw.model.AdminDAO;
import dksw.model.BoardDAO;
import dksw.model.DepartmentDAO;
import dksw.model.LabAchievementsDAO;
import dksw.model.LabIntroDAO;
import dksw.model.LabMembersDAO;
import dksw.model.LabPaperDAO;
import dksw.model.LabProjectDAO;
import dksw.model.domain.AdminPermission;
import dksw.model.domain.DepartmentProfessor;
import dksw.model.domain.LabAchievements;
import dksw.model.domain.LabIntro;
import dksw.model.domain.LabMembers;
import dksw.model.domain.LabPaper;
import dksw.model.domain.LabProject;
import dksw.util.CommonUtil;
import dksw.util.PermissionCheck;

public class LabController extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		
		if(action.equals("getLabData")) {
			getLabData(req, res);
		} else if(action.equals("writeLabTableData")) {
			writeLabTableData(req, res);
		} else if(action.equals("deleteLabTableData")) {
			deleteLabTableData(req, res);
		}
		
	}

	private void getLabData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		LabIntro introData = null;
		ArrayList<LabMembers> membersData = null;
		ArrayList<LabAchievements> achievementsData = null;
		ArrayList<LabPaper> paperData = null;
		ArrayList<LabProject> projectData = null;
		
		try {
			int inputLabCode = (req.getParameter("inputLabCode") != null) ? Integer.parseInt(req.getParameter("inputLabCode")) : null;
			
			JSONObject jObject = new JSONObject();
			JSONArray jArrayMembers = new JSONArray();
			JSONArray jArrayAchievements = new JSONArray();
			JSONArray jArrayPaper = new JSONArray();
			JSONArray jArrayProject = new JSONArray();
			
			introData = LabIntroDAO.getLabIntro(inputLabCode);
			membersData = LabMembersDAO.getLabMembers(inputLabCode);
			achievementsData = LabAchievementsDAO.getLabAchievements(inputLabCode);
			paperData = LabPaperDAO.getLabPaper(inputLabCode);
			projectData = LabProjectDAO.getLabProject(inputLabCode);

			// Intro
			jObject.put("dkswLabIntroIntroduction", introData.getDkswLabIntroIntroduction().replaceAll("\n", "<br />"));

			for(int i=0; i<CommonUtil.userSpilt(introData.getDkswLabIntroPicture()).size(); i++) {
				jObject.put("dkswLabIntroPicture_" + i, CommonUtil.userSpilt(introData.getDkswLabIntroPicture()).get(i));
			}
			
			jObject.put("dkswLabIntroEditDate", introData.getDkswLabIntroEditDate());
			jObject.put("dkswLabIntroEditRightIndex", introData.getDkswLabIntroEditRightIndex());

			// Members
			DepartmentProfessor professor = null;
			
			for(int i=0; i<membersData.size(); i++) {
				JSONObject tempMember = new JSONObject();
				
				System.out.println(membersData.get(i).getDkswLabMembersGroup());
				
				if(membersData.get(i).getDkswLabMembersGroup() == 1) { // 교수
					professor = DepartmentDAO.getProfessor(membersData.get(i).getDkswMemberNo());
					
					jObject.put("dkswLabMembersProfessorNameKo", professor.getDkswDepartmentProfessorNameKo());
					jObject.put("dkswLabMembersProfessorNameEn",professor.getDkswDepartmentProfessorNameEn());
					jObject.put("dkswLabMembersProfessorField",professor.getDkswDepartmentProfessorField());
					jObject.put("dkswLabMembersProfessorPicture", professor.getDkswDepartmentProfessorPicture());
					jObject.put("dkswLabMembersProfessorContact", professor.getDkswDepartmentProfessorContact());
					jObject.put("dkswLabMembersProfessorEmail", professor.getDkswDepartmentProfessorEmail());
					
					System.out.println(professor.getDkswDepartmentProfessorNameKo());
					
				} else { // 나머지
					tempMember.put("dkswLabMembersGroup", membersData.get(i).getDkswLabMembersGroup());
					tempMember.put("dkswLabMembersAdmissionYear", membersData.get(i).getDkswLabMembersAdmissionYear());
					tempMember.put("dkswLabMembersNameKo", membersData.get(i).getDkswLabMembersNameKo());
					tempMember.put("dkswLabMembersNameEn", membersData.get(i).getDkswLabMembersNameEn());
					tempMember.put("dkswLabMembersEmail", membersData.get(i).getDkswLabMembersEmail());
					tempMember.put("dkswLabMembersWorkPlace", membersData.get(i).getDkswLabMembersWorkPlace());
					tempMember.put("dkswLabMembersPicture", membersData.get(i).getDkswLabMembersPicture());
					tempMember.put("dkswMemberNo", membersData.get(i).getDkswMemberNo());
					jArrayMembers.add(tempMember);					
				}
			}
				
			// Achievements
			for(int i=0; i<achievementsData.size(); i++) {
				JSONObject tempAchievement = new JSONObject();
				tempAchievement.put("dkswLabAchievementsNo", achievementsData.get(i).getDkswLabAchievementsNo());		
				tempAchievement.put("dkswLabAchievementsYear", achievementsData.get(i).getDkswLabAchievementsYear());
				tempAchievement.put("dkswLabAchievementsMonth", achievementsData.get(i).getDkswLabAchievementsMonth());
				tempAchievement.put("dkswLabAchievementsContent", achievementsData.get(i).getDkswLabAchievementsContent());
				tempAchievement.put("dkswLabAchievementsEditDate", achievementsData.get(i).getDkswLabAchievementsEditDate());
				tempAchievement.put("dkswLabAchievementsEditRightIndex", achievementsData.get(i).getDkswLabAchievementsEditRightIndex());
				jArrayAchievements.add(tempAchievement);
			}
			
			// Paper
			for(int i=0; i<paperData.size(); i++) {
				JSONObject tempPaper = new JSONObject();
				tempPaper.put("dkswLabPaperNo", paperData.get(i).getDkswLabPaperNo());
				tempPaper.put("dkswLabPaperTitle", paperData.get(i).getDkswLabPaperTitle());
				tempPaper.put("dkswLabPaperContent", paperData.get(i).getDkswLabPaperContent());
				tempPaper.put("dkswLabPaperParticipants", paperData.get(i).getDkswLabPaperParticipants());
				tempPaper.put("dkswLabPaperEditDate", paperData.get(i).getDkswLabPaperEditDate());
				tempPaper.put("dkswLabPaperEditRightIndex", paperData.get(i).getDkswLabPaperEditRightIndex());
				jArrayPaper.add(tempPaper);
			}
			
			// Project
			for(int i=0; i<projectData.size(); i++) {
				JSONObject tempProject = new JSONObject();
				tempProject.put("dkswLabProjectNo", projectData.get(i).getDkswLabProjectNo());
				tempProject.put("dkswLabProjectName", projectData.get(i).getDkswLabProjectName());
				tempProject.put("dkswLabProjectStartYear", projectData.get(i).getDkswLabProjectStartYear());
				tempProject.put("dkswLabProjectStartMonth", projectData.get(i).getDkswLabProjectStartMonth());
				tempProject.put("dkswLabProjectEndYear", projectData.get(i).getDkswLabProjectEndYear());
				tempProject.put("dkswLabProjectEndMonth", projectData.get(i).getDkswLabProjectEndMonth());
				tempProject.put("dkswLabProjectContent", projectData.get(i).getDkswLabProjectContent());
				tempProject.put("dkswLabProjectEditDate", projectData.get(i).getDkswLabProjectEditDate());
				tempProject.put("dkswLabProjectEditRightIndex", projectData.get(i).getDkswLabProjectEditRightIndex());
				
				jArrayProject.add(tempProject);
			}

			jObject.put("dkswLabMembers", jArrayMembers);
			jObject.put("dkswLabAchievements", jArrayAchievements);
			jObject.put("dkswLabPaper", jArrayPaper);
			jObject.put("dkswLabProject", jArrayProject);
			
			// 수정 권한 체크
			HttpSession sessionMember = req.getSession(false);
			
			if(sessionMember != null) { // 세션이 존재하는 경우
				String memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? (sessionMember.getAttribute("dkswMemberCategory").toString()) : null;
				int memberNo = (sessionMember.getAttribute("dkswMemberNo") != null) ? Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString()) : 0;
				
				if(memberNo > 0) { // 로그인 되어있는 경우
					AdminPermission permission = null;
					boolean checkPermission = false;
					
					try {
						String inputAdminPermissionId = "page_lab";					
						permission = AdminDAO.getPermission(inputAdminPermissionId);
						
						checkPermission = PermissionCheck.checkPermission(permission.getDkswAdminPermissionAuthor(), memberCategory);
						
						if(checkPermission) {
							jObject.put("dkswLabModifyPermission", "OK");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");

			res.getWriter().write(jObject.toString());

			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (IO에러)");
		}				
	}
	
	private void writeLabTableData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		boolean checkWriteLabRecord = false;
		
		try {
			int inputLabCode = (req.getParameter("inputLabCode") != null) ? Integer.parseInt(req.getParameter("inputLabCode")) : null;
			int inputLabItem = (req.getParameter("inputLabItem") != null) ? Integer.parseInt(req.getParameter("inputLabItem")) : null;
			String inputLabData1 = (req.getParameter("inputLabData1") != null) ? (req.getParameter("inputLabData1")) : null;
			String inputLabData2 = (req.getParameter("inputLabData2") != null) ? (req.getParameter("inputLabData2")) : null;
			String inputLabData3 = (req.getParameter("inputLabData3") != null) ? (req.getParameter("inputLabData3")) : null;	
			String inputLabData4 = (req.getParameter("inputLabData4") != null) ? (req.getParameter("inputLabData4")) : null;
			String inputLabData5 = (req.getParameter("inputLabData5") != null) ? (req.getParameter("inputLabData5")) : null;
			String inputLabData6 = (req.getParameter("inputLabData6") != null) ? (req.getParameter("inputLabData6")) : null;
			
			switch(inputLabItem) {
				case 0: // Achievements
					checkWriteLabRecord = LabAchievementsDAO.writeRecord(inputLabCode, inputLabData1, inputLabData2, inputLabData3);
					break;
				case 1: // Paper
					checkWriteLabRecord = LabPaperDAO.writeRecord(inputLabCode, inputLabData1, inputLabData2, inputLabData3);
					break;
				case 2: // Project
					checkWriteLabRecord = LabProjectDAO.writeRecord(inputLabCode, inputLabData1, inputLabData2, inputLabData3, inputLabData4,inputLabData5,inputLabData6);
					break;
			}
		
			if(checkWriteLabRecord) {
				res.getWriter().write("WriteOK");
			} else {
				res.getWriter().write("Fail");				
			}
	
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	private void deleteLabTableData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		boolean checkDeleteLabRecord = false;
		
		try {
			int inputLabItem = (req.getParameter("inputLabItem") != null) ? Integer.parseInt(req.getParameter("inputLabItem")) : null; 
			int inputLabRecordNo = (req.getParameter("inputLabRecordNo") != null) ? Integer.parseInt(req.getParameter("inputLabRecordNo")) : null; 
			
			switch(inputLabItem) {
				case 0: // Achievements
					checkDeleteLabRecord = LabAchievementsDAO.deleteRecord(inputLabRecordNo);
					break;
				case 1: // Paper
					checkDeleteLabRecord = LabPaperDAO.deleteRecord(inputLabRecordNo);
					break;
				case 2: // Project
					checkDeleteLabRecord = LabProjectDAO.deleteRecord(inputLabRecordNo);
					break;
			}
			
			if(checkDeleteLabRecord) {
				res.getWriter().write("deleteOK");
			} else {
				res.getWriter().write("Fail");				
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//연구실 member 추가
	private void addLabMembers(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		boolean checkInsertLabMembersRecord = false;
		
		try {
			int inputLabMembersCode = (req.getParameter("inputLabMembersCode") != null) ? Integer.parseInt(req.getParameter("inputLabMembersCode")) : null; 
			String inputLabMembersPicture = (req.getParameter("inputLabMembersPicture") != null) ? req.getParameter("inputLabMembersPicture") : null;
			String inputLabMembersNameKo = (req.getParameter("inputLabMembersNameKo") != null) ? req.getParameter("inputLabMembersNameKo") : null;
			String inputLabMembersNameEn = (req.getParameter("inputLabMembersNameEn") != null) ? req.getParameter("inputLabMembersNameEn") : null;
			String inputLabMembersAdmissionYear = (req.getParameter("inputLabMembersAdmissionYear") != null) ? req.getParameter("inputLabMembersAdmissionYear") : null;
				String inputLabMembersEmail = (req.getParameter("inputLabMembersEmail") != null) ? req.getParameter("inputLabMembersEmail") : null;
				int inputLabMembersGroup = (req.getParameter("inputLabMembersGroup") != null) ? Integer.parseInt(req.getParameter("inputLabMembersGroup")) : null;
				String inputLabMembersEtc = (req.getParameter("inputLabMembersEtc") != null) ? req.getParameter("inputLabMembersEtc") : null;
				long inputLabMembersEditdate = (System.currentTimeMillis())/1000;
				int inputLabMembersEditRightIndex = 0;
				int inputDepartmentProfessorNo = (req.getParameter("inputDepartmentProfessorNo") != null) ? Integer.parseInt(req.getParameter("inputDepartmentProfessorNo")) : null; 
	
				
				checkInsertLabMembersRecord = LabMembersDAO.addLabMembers(inputLabMembersCode, inputLabMembersPicture, inputLabMembersNameKo,inputLabMembersNameEn, inputLabMembersAdmissionYear, inputLabMembersEmail,
						inputLabMembersGroup, inputLabMembersEtc, inputLabMembersEditdate, inputLabMembersEditRightIndex, inputDepartmentProfessorNo);
			
				if(checkInsertLabMembersRecord == true ) {
					res.getWriter().write("onlineAuthChecked");
				} else {
					res.getWriter().write("Fail");
				}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	// 연구실 멤버 수정 
	private void modifyLabMembers(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		boolean checkModifyLabMembersRecord = false;
		
		try {
				int inputLabMembersCode = (req.getParameter("inputLabMembersCode") != null) ? Integer.parseInt(req.getParameter("inputLabMembersCode")) : null; 
				String inputLabMembersPicture = (req.getParameter("inputLabMembersPicture") != null) ? req.getParameter("inputLabMembersPicture") : null;
				String inputLabMembersNameKo = (req.getParameter("inputLabMembersNameKo") != null) ? req.getParameter("inputLabMembersNameKo") : null;
				String inputLabMembersNameEn = (req.getParameter("inputLabMembersNameEn") != null) ? req.getParameter("inputLabMembersNameEn") : null;
				String inputLabMembersAdmissionYear = (req.getParameter("inputLabMembersAdmissionYear") != null) ? req.getParameter("inputLabMembersAdmissionYear") : null;
				String inputLabMembersEmail = (req.getParameter("inputLabMembersEmail") != null) ? req.getParameter("inputLabMembersEmail") : null;
				int inputLabMembersGroup = (req.getParameter("inputLabMembersGroup") != null) ? Integer.parseInt(req.getParameter("inputLabMembersGroup")) : null;
				String inputLabMembersEtc = (req.getParameter("inputLabMembersEtc") != null) ? req.getParameter("inputLabMembersEtc") : null;
				long inputLabMembersEditdate = (System.currentTimeMillis())/1000;
				int inputLabMembersEditRightIndex = 0;
				int inputDepartmentProfessorNo = (req.getParameter("inputDepartmentProfessorNo") != null) ? Integer.parseInt(req.getParameter("inputDepartmentProfessorNo")) : null; 
	
				
				checkModifyLabMembersRecord = LabMembersDAO.modifyLabMembers(inputLabMembersCode, inputLabMembersPicture, inputLabMembersNameKo,inputLabMembersNameEn, inputLabMembersAdmissionYear,
						inputLabMembersGroup, inputLabMembersEtc, inputLabMembersEditdate, inputLabMembersEditRightIndex, inputDepartmentProfessorNo,inputLabMembersEmail);
			
				if(checkModifyLabMembersRecord == true ) {
					res.getWriter().write("onlineAuthChecked");
				} else {
					res.getWriter().write("Fail");
				}
			
			} 
		catch (SQLException se) {
		req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
		req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	//연구실 멤버 삭제 
	private void deleteLabMembers(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		boolean checkDeletLabMembers = false;
		
		try {
			int inputLabMembersEmail = (req.getParameter("inputLabMembersEmail") != null) ? Integer.parseInt(req.getParameter("inputLabMembersEmail")) : null;

			HttpSession sessionMember = req.getSession();
			
			if(sessionMember.getAttribute("getDkswLabMembersEmail").toString().equals("3")) {
				
					
				
				checkDeletLabMembers = BoardDAO.deletePost(inputLabMembersEmail);
				
				if(checkDeletLabMembers) {
					res.getWriter().write("DeleteOK");
				} else {
					res.getWriter().write("Fail");
				}
				
			} else { 
				return;
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
}

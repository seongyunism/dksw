package dksw.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dksw.model.DepartmentDAO;
import dksw.model.LabAchievementsDAO;
import dksw.model.LabIntroDAO;
import dksw.model.LabMembersDAO;
import dksw.model.LabPaperDAO;
import dksw.model.LabProjectDAO;

import dksw.model.domain.LabAchievements;
import dksw.model.domain.LabIntro;
import dksw.model.domain.LabMembers;
import dksw.model.domain.LabPaper;
import dksw.model.domain.LabProject;
import dksw.util.UnixTimeConvertor;

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

			
			// 데이터를 삽입

			// Intro
			jObject.put("dkswLabIntroIntroduction", introData.getDkswLabIntroIntroduction().replaceAll("\n", "<br />"));
			jObject.put("dkswLabIntroPicture", introData.getDkswLabIntroPicture());
			jObject.put("dkswLabIntroEditDate", introData.getDkswLabIntroEditDate());
			jObject.put("dkswLabIntroEditRightIndex", introData.getDkswLabIntroEditRightIndex());

			// Members
			for(int i=0; i<membersData.size(); i++) {
				JSONObject tempMember = new JSONObject();
				tempMember.put("dkswLabMembersPicture", membersData.get(i).getDkswLabMembersPicture());
				tempMember.put("dkswLabMembersNameKo", membersData.get(i).getDkswLabMembersNameKo());
				tempMember.put("dkswLabMembersNameEn", membersData.get(i).getDkswLabMembersNameEn());
				tempMember.put("dkswLabMembersAdmissionYear", membersData.get(i).getDkswLabMembersAdmissionYear());
				tempMember.put("dkswLabMembersEmail", membersData.get(i).getDkswLabMembersEmail());
				tempMember.put("dkswLabMembersGroup", membersData.get(i).getDkswLabMembersGroup());
				tempMember.put("dkswLabMembersEtc", membersData.get(i).getDkswLabMembersEtc());
				tempMember.put("dkswLabMembersEditDate", membersData.get(i).getDkswLabMembersEditDate());
				tempMember.put("dkswLabMembersEditRightIndex", membersData.get(i).getDkswLabMembersEditRightIndex());
				tempMember.put("dkswDepartmentProfessorNo", membersData.get(i).getDkswDepartmentProfessorNo());
				jArrayMembers.add(tempMember);
			}
			
			jObject.put("dkswLabMembers", jArrayMembers);
			
			// Achievements
			for(int i=0; i<achievementsData.size(); i++) {
				JSONObject tempAchievement = new JSONObject();
				tempAchievement.put("dkswLabAchievementsYear", achievementsData.get(i).getDkswLabAchievementsYear());
				tempAchievement.put("dkswLabAchievementsMonth", achievementsData.get(i).getDkswLabAchievementsMonth());
				tempAchievement.put("dkswLabAchievementsContent", achievementsData.get(i).getDkswLabAchievementsContent());
				tempAchievement.put("dkswLabAchievementsEditDate", achievementsData.get(i).getDkswLabAchievementsEditDate());
				tempAchievement.put("dkswLabAchievementsEditRightIndex", achievementsData.get(i).getDkswLabAchievementsEditRightIndex());
				jArrayAchievements.add(tempAchievement);
			}
		
			jObject.put("dkswLabAchievements", jArrayAchievements);
			
			// Paper
			for(int i=0; i<paperData.size(); i++) {
				JSONObject tempPaper = new JSONObject();
				tempPaper.put("dkswLabPaperTitle", paperData.get(i).getDkswLabPaperTitle());
				tempPaper.put("dkswLabPaperContent", paperData.get(i).getDkswLabPaperContent());
				tempPaper.put("dkswLabPaperParticipants", paperData.get(i).getDkswLabPaperParticipants());
				tempPaper.put("dkswLabPaperEditDate", paperData.get(i).getDkswLabPaperEditDate());
				tempPaper.put("dkswLabPaperEditRightIndex", paperData.get(i).getDkswLabPaperEditRightIndex());
				jArrayPaper.add(tempPaper);
			}
			
			jObject.put("dkswLabPaper", jArrayPaper);
			
			// Project
			
			for(int i=0; i<projectData.size(); i++) {
				JSONObject tempProject = new JSONObject();
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
					
			jObject.put("dkswLabProject", jArrayProject);
			
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");

			res.getWriter().write(jObject.toString());

			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (IO에러)");
		}				
	}
}

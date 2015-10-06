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
		LabAchievements achievementsData = null;
		LabPaper paperData = null;
		LabProject projectData = null;		
		
		try {

			int inputLabCode = (req.getParameter("inputLabCode") != null) ? Integer.parseInt(req.getParameter("inputLabCode")) : null;
			
			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();
			
			introData = LabIntroDAO.getLabIntro(inputLabCode);
			membersData = LabMembersDAO.getLabMembers(inputLabCode);
//			achievementsData = LabAchievementsDAO.getLabAchievements(inputLabCode);
//			paperData = LabPaperDAO.getLabPaper(inputLabCode);
//			projectData = LabProjectDAO.getLabProject(inputLabCode);

			
			// 데이터를 삽입

			// Intro
			jObject.put("dkswLabIntroIntroduction", introData.getDkswLabIntroIntroduction());
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
				jArray.add(tempMember);
			}
			
			jObject.put("dkswLabMembers", jArray);
			
			// Achievements
		
			
			
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

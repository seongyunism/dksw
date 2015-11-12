package dksw.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dksw.model.AdminDAO;
import dksw.model.DepartmentDAO;
import dksw.model.domain.AdminPermission;
import dksw.model.domain.DepartmentClub;
import dksw.model.domain.DepartmentContact;
import dksw.model.domain.DepartmentGreeting;
import dksw.model.domain.DepartmentHistory;
import dksw.model.domain.DepartmentIntro;
import dksw.model.domain.DepartmentProfessor;
import dksw.util.CommonUtil;
import dksw.util.PermissionCheck;
import dksw.util.UnixTimeConvertor;

public class DepartmentController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");

		if (action.equals("getGreetingData")) {
			getGreetingData(req, res);
		} else if (action.equals("getHistoryData")) {
			getHistoryData(req, res);
		} else if (action.equals("getProfessorData")) {
			getProfessorData(req, res);
		} else if (action.equals("getContactData")) {
			getContactData(req, res);
		} else if (action.equals("getIntroData")) {
			getIntroData(req, res);
		} else if(action.equals("getClubData")){
			getClubData(req, res);
		} else if(action.equals("writeDepartmentHistoryData")){
			writeDepartmentHistoryData(req,res);
		} else if(action.equals("deleteDepartmentHistoryData")){
			deleteDepartmentHistoryData(req,res);
		}
	} 

	// 학과 소개
	private void getIntroData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		DepartmentIntro thisData = null;
		List<String> list = new ArrayList<String>();
		
		try {
			thisData = DepartmentDAO.getIntro();

			list = CommonUtil.userSpilt(thisData.getdkswDepartmentIntroductionContent());

			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();

			// 데이터 삽입
			jObject.put("dkswDepartmentIntroductionContentIntro", list.get(0));
			jObject.put("dkswDepartmentIntroductionContentAptitude", list.get(1));
			jObject.put("dkswDepartmentIntroductionContentCareer", list.get(2));
			jObject.put("getDkswDepartmentIntroductionEditDate", thisData.getDkswDepartmentIntroductionEditDate());
			jObject.put("setDkswDepartmentIntroductionEditRightIndex", thisData.getDkswDepartmentIntroductionEditRightIndex());

			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");

			res.getWriter().write(jObject.toString());
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (IO에러)");
		}

	}

	// 학과장 인사
	public void getGreetingData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		DepartmentGreeting thisData = null;

		try {
			thisData = DepartmentDAO.getGreeting();

			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();

			// 데이터를 삽입
			jObject.put("dkswDepartmentGreetingTitle", thisData.getDkswDepartmentGreetingTitle());
			jObject.put("dkswDepartmentGreetingPicture", thisData.getDkswDepartmentGreetingPicture());
			jObject.put("dkswDepartmentGreetingContent", thisData.getDkswDepartmentGreetingContent());
			jObject.put("dkswDepartmentGreetingEditDate", UnixTimeConvertor.toConvertTimeFromUnixTime(thisData.getDkswDepartmentGreetingEditDate()));
			jObject.put("dkswDepartmentProfessorNameKo", DepartmentDAO.getProfessor(thisData.getDkswMemberNo()).getDkswDepartmentProfessorNameKo());
			jObject.put("dkswDepartmentProfessorContact", DepartmentDAO.getProfessor(thisData.getDkswMemberNo()).getDkswDepartmentProfessorContact());
			jObject.put("dkswDepartmentProfessorLabLocation", DepartmentDAO.getProfessor(thisData.getDkswMemberNo()).getDkswDepartmentProfessorLabLocation());
			jObject.put("dkswDepartmentProfessorEmail", DepartmentDAO.getProfessor(thisData.getDkswMemberNo()).getDkswDepartmentProfessorEmail());

			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");

			res.getWriter().write(jObject.toString());

		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (IO에러)");
		}
	}

	// 학과 연혁
	private void getHistoryData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		ArrayList<DepartmentHistory> thisData = null;

		try {
			thisData = DepartmentDAO.getHistory();

			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();

			// 데이터를 삽입
			for (int i = 0; i < thisData.size(); i++) {
				JSONObject tempData = new JSONObject();
				tempData.put("dkswDepartmentHistoryNo",thisData.get(i).getDkswDepartmentHistoryNo());
				tempData.put("dkswDepartmentHistoryYear", thisData.get(i).getDkswDepartmentHistoryYear());
				tempData.put("dkswDepartmentHistoryMonth", thisData.get(i).getDkswDepartmentHistoryMonth());
				tempData.put("dkswDepartmentHistoryContent", thisData.get(i).getDkswDepartmentHistoryContent().replaceAll("\n", "<br />"));
				tempData.put("dkswDepartmentHistoryVisible", thisData.get(i).getDkswDepartmentHistoryVisible());
				jArray.add(tempData);
			}

			jObject.put("dkswDepartmentHistory", jArray);
			
			HttpSession sessionMember = req.getSession(false);
			
			if(sessionMember != null) { // 세션이 존재하는 경우
				String memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? (sessionMember.getAttribute("dkswMemberCategory").toString()) : null;
				int memberNo = (sessionMember.getAttribute("dkswMemberNo") != null) ? Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString()) : 0;
				
				if(memberNo > 0) { // 로그인 되어있는 경우
					AdminPermission permission = null;
					boolean checkPermission = false;
					
					try {
						String inputAdminMenuName = "page_department_history";
						permission = AdminDAO.getPermission(inputAdminMenuName);
						checkPermission = PermissionCheck.checkPermission(permission.getDkswAdminPermissionAuthor(), memberCategory);
						
						if(checkPermission) {
							jObject.put("dkswDepartmentModifyPermission", "OK");
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

	// 학과 교수
	private void getProfessorData(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {

		ArrayList<DepartmentProfessor> thisData = null;

		try {
			thisData = DepartmentDAO.getProfessorList();

			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();

			// 데이터를 삽입
			for (int i = 0; i < thisData.size(); i++) {
				JSONObject tempData = new JSONObject();
				tempData.put("dkswDepartmentProfessorNo", thisData.get(i).getDkswDepartmentProfessorNo());
				tempData.put("dkswDepartmentProfessorNameKo", thisData.get(i).getDkswDepartmentProfessorNameKo());
				tempData.put("dkswDepartmentProfessorNameEn", thisData.get(i).getDkswDepartmentProfessorNameEn());
				tempData.put("dkswDepartmentProfessorLabName", thisData.get(i).getDkswDepartmentProfessorLabName());
				tempData.put("dkswDepartmentProfessorField", thisData.get(i).getDkswDepartmentProfessorField());
				tempData.put("dkswDepartmentProfessorLabLocation", thisData.get(i).getDkswDepartmentProfessorLabLocation());
				tempData.put("dkswDepartmentProfessorEmail", thisData.get(i).getDkswDepartmentProfessorEmail());
				tempData.put("dkswDepartmentProfessorContact", thisData.get(i).getDkswDepartmentProfessorContact());
				tempData.put("dkswDepartmentProfessorPicture", thisData.get(i).getDkswDepartmentProfessorPicture());
				tempData.put("dkswDepartmentProfessorHomepage", thisData.get(i).getDkswDepartmentProfessorHomepage());
				tempData.put("dkswMemberNo", thisData.get(i).getDkswMemberNo());
				jArray.add(tempData);
			}

			jObject.put("dkswDepartmentProfessor", jArray);

			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");

			res.getWriter().write(jObject.toString());

		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (IO에러)");
		}
	}
	
	// 동아리 소개
	private void getClubData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		DepartmentClub thisData = null;
		
		try {
			int inputClubCode = (req.getParameter("inputClubCode") != null) ? Integer.parseInt(req.getParameter("inputClubCode")) : null;	
			
			thisData = DepartmentDAO.getClub(inputClubCode);

			JSONObject jObject = new JSONObject();

			// 데이터 삽입
			jObject.put("dkswDepartmentClubNo", thisData.getDkswDepartmentClubNo());
			jObject.put("dkswDepartmentClubNameKo", thisData.getDkswDepartmentClubNameKo());
			jObject.put("dkswDepartmentClubNameEn", thisData.getDkswDepartmentClubNameEn());
			jObject.put("dkswDepartmentClubContent", thisData.getDkswDepartmentClubContent());
			jObject.put("dkswDepartmentClubPicture", thisData.getDkswDepartmentClubPicture());
			jObject.put("dkswDepartmentClubEditDate", thisData.getDkswDepartmentClubEditDate());
			jObject.put("dkswDepartmentClubEditRightIndex", thisData.getDkswDepartmentClubEditRightIndex());


			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");


			res.getWriter().write(jObject.toString());
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (IO에러)");
		}

	}

	// 학과 위치 및 연락처
	private void getContactData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		DepartmentContact thisData = null;

		try {
			thisData = DepartmentDAO.getContact();

			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();

			// 데이터를 삽입
			jObject.put("dkswDepartmentContactNumber", thisData.getDkswDepartmentContactNumber());
			jObject.put("dkswDepartmentContactLocation", thisData.getDkswDepartmentContactLocation());
			jObject.put("dkswDepartmentContactEmail", thisData.getDkswDepartmentContactEmail());
			jObject.put("dkswDepartmentContactFax", thisData.getDkswDepartmentContactFax());
			jObject.put("dkswDepartmentContactOffice", thisData.getDkswDepartmentContactOffice());
			jObject.put("dkswDepartmentContactRoom", thisData.getDkswDepartmentContactRoom());

			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");

			res.getWriter().write(jObject.toString());

		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (IO에러)");
		}
	}
	
	
	private void writeDepartmentHistoryData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		boolean checkWriteDepartmentHistoryRecord = false;
		
		try {
			int inputDepartmentData1 = (req.getParameter("inputDepartmentData1") != null) ? Integer.parseInt(req.getParameter("inputDepartmentData1")) : null;
			int inputDepartmentData2 = (req.getParameter("inputDepartmentData2") != null) ? Integer.parseInt(req.getParameter("inputDepartmentData2")) : null;
			String inputDepartmentData3 = (req.getParameter("inputDepartmentData3") != null) ? (req.getParameter("inputDepartmentData3")) : null;
			
			checkWriteDepartmentHistoryRecord = DepartmentDAO.writeRecord(inputDepartmentData1, inputDepartmentData2, inputDepartmentData3);
									
			if(checkWriteDepartmentHistoryRecord) {
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
	
	private void deleteDepartmentHistoryData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		boolean checkDeleteDepartmentHistoryRecord = false;
		
		try {
			int inputDepartmentData1 = (req.getParameter("inputDepartmentData1") != null) ? Integer.parseInt(req.getParameter("inputDepartmentData1")) : null; 
						
			checkDeleteDepartmentHistoryRecord = DepartmentDAO.deleteRecord(inputDepartmentData1);
				
			if(checkDeleteDepartmentHistoryRecord) {
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
}
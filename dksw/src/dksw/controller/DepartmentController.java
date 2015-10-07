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
import dksw.model.domain.DepartmentGreeting;
import dksw.model.domain.DepartmentHistory;
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
			for(int i=0; i<thisData.size(); i++)
			{
				JSONObject tempData = new JSONObject();
				tempData.put("dkswDepartmentHistoryYear", thisData.get(i).getDkswDepartmentHistoryYear());
				tempData.put("dkswDepartmentHistoryMonth", thisData.get(i).getDkswDepartmentHistoryMonth());
				tempData.put("dkswDepartmentHistoryContent", thisData.get(i).getDkswDepartmentHistoryContent());
				tempData.put("dkswDepartmentHistoryVisible", thisData.get(i).getDkswDepartmentHistoryVisible());
				tempData.put("dkswDepartmentHistoryEditDate", UnixTimeConvertor.toConvertTimeFromUnixTime(thisData.get(i).getDkswDepartmentHistoryEditDate()));
				tempData.put("dkswDepartmentHistoryEditPermission", thisData.get(i).getDkswDepartmentHistoryPermission());
				jArray.add(tempData);
			}
			
			jObject.put("dkswDepartmentHistory", jArray);
			
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			
			res.getWriter().write(jObject.toString());

		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 데이터 가져오기 실패! (IO에러)");
		}

	}

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
			jObject.put("dkswDepartmentGreetingEditPermission", thisData.getDkswDepartmentGreetingEditPermission());

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

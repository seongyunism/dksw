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

import dksw.model.BoardDAO;
import dksw.model.DepartmentDAO;
import dksw.model.domain.Board;
import dksw.model.domain.DepartmentGreeting;
import dksw.util.UnixTimeConvertor;

public class BoardController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		
		if(action.equals("getBoardData")) {
			getBoardData(req, res);
		} 
	}

	public void getBoardData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		ArrayList<Board> list = null;
		
		try {
			int inputBoardCategory = (req.getParameter("inputBoardCategory") != null) ? Integer.parseInt(req.getParameter("inputBoardCategory")) : null;
			
			list = BoardDAO.getBoard(inputBoardCategory);
		
			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();
			
			
			for(int i=0; i<list.size(); i++) {
				JSONObject temp = new JSONObject();
				temp.put("dkswBoardNo", list.get(i).getDkswBoardNo());
				temp.put("dkswBoardCategory", list.get(i).getDkswBoardCategory());
				temp.put("dkswBoardTitle", list.get(i).getDkswBoardTitle());
				temp.put("dkswMemberNo", list.get(i).getDkswMemberNo());
				temp.put("dkswBoardWriteDate", list.get(i).getDkswBoardWriteDate());
				temp.put("dkswBoardReadnum", list.get(i).getDkswBoardReadnum());
				temp.put("dkswBoardContent", list.get(i).getDkswBoardContent());
				temp.put("dkswBoardPicture", list.get(i).getDkswBoardPicture());
				
				jArray.add(temp);
			}
			
			jObject.put("dkswBoard", jArray);
				
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

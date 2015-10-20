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
import dksw.model.domain.Board;

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
		
		if(action.equals("getBoardListData")) {
			getBoardListData(req, res);
		} else if(action.equals("getBoardPermission")) {
			getBoardPermissionData(req, res);
		}
	}
	
	private void getBoardPermissionData(HttpServletRequest req, HttpServletResponse res) {
		
//		try {
//			int 
			
			
//		}
		
	}

	// 학과 공지, 학생회 공지, 채용정보, 자유게시판에서 리스트 가져오기
	public void getBoardListData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		ArrayList<Board> posts = null;
		String[] tempContent = null;
		
		try {
			int inputBoardCategory = (req.getParameter("inputBoardCategory") != null) ? Integer.parseInt(req.getParameter("inputBoardCategory")) : null;
			
			posts = BoardDAO.getBoard(inputBoardCategory);
		
			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();
				
			for(int i=0; i<posts.size(); i++) {
				JSONObject temp = new JSONObject();
				temp.put("dkswBoardNo", posts.get(i).getDkswBoardNo());
				temp.put("dkswBoardCategory", posts.get(i).getDkswBoardCategory());
				temp.put("dkswMemberNo", posts.get(i).getDkswMemberNo());
				temp.put("dkswBoardWriteDate", posts.get(i).getDkswBoardWriteDate());
				temp.put("dkswBoardReadnum", posts.get(i).getDkswBoardReadnum());
				temp.put("dkswBoardTitle", posts.get(i).getDkswBoardTitle());
				
				// 본문 앞부분 자르기
		        tempContent = posts.get(i).getDkswBoardContent().split("\n\n");
				temp.put("dkswBoardContent", tempContent[0]);
				
				// 대체 이미지 삽입
				if(posts.get(i).getDkswBoardPicture().equals("")) { // 저장된 이미지가 없을 경우
					temp.put("dkswBoardPicture", req.getContextPath() + "/04_upload/files/sub_01/notice/no-image.jpg");					
				} else {
					temp.put("dkswBoardPicture", posts.get(i).getDkswBoardPicture());
				}
				
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

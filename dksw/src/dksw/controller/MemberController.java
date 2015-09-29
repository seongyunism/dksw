package dksw.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dksw.model.MemberDAO;

public class MemberController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		
		if(action.equals("checkOfflineAuthCode")) {
			checkOfflineAuthCode(req, res);
		} 
	}

	// 오프라인 가입 인증코드 체크
	private void checkOfflineAuthCode(HttpServletRequest req, HttpServletResponse res) throws ServletException {
		
		boolean checkOfflineAuthCode = false;

		try {
			String inputOfflineAuthCode = (req.getParameter("inputOfflineAuthCode") != null) ? req.getParameter("inputOfflineAuthCode") : null;
			checkOfflineAuthCode = MemberDAO.checkOfflineAuthCode(inputOfflineAuthCode);
			
			if(checkOfflineAuthCode) {
				res.getWriter().write("Checked");
			} else {
				res.getWriter().write("Fail");				
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 포스트 가져오기 실패! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 포스트 가져오기 실패! (IO에러)");
		}
	}

	
	
	
	
	
	
	
}

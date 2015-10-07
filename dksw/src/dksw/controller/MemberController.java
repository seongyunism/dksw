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
		} else if(action.equals("joinMember")) {
			joinMember(req, res);
		}
	}

	// 오프라인 가입 인증코드 체크
	private void checkOfflineAuthCode(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
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
			req.setAttribute("errorMsg", "ERROR : 인증 오류! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 인증 오류! (IO에러)");
		}
	}

	// 회원가입
	private void joinMember(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		boolean checkJoinMember = false;
		
		try {
			int inputMemberCategory = (req.getParameter("inputMemberCategory") != null) ? Integer.parseInt(req.getParameter("inputMemberCategory")) : null; 
			String inputMemberEmail = (req.getParameter("inputMemberEmail") != null) ? req.getParameter("inputMemberEmail") : null;
			String inputMemberPassword = (req.getParameter("inputMemberPassword") != null) ? req.getParameter("inputMemberPassword") : null;
			String inputMemberStudentNo = (req.getParameter("inputMemberStudentNo") != null) ? req.getParameter("inputMemberStudentNo") : null;
			String inputMemberName = (req.getParameter("inputMemberName") != null) ? req.getParameter("inputMemberName") : null;
			int inputMemberSNS = 0;
			int inputMemberOnlineAuth = 0;
			String inputMemberOnlineAuthCode = "";
			String inputMemberOfflineAuthCode = (req.getParameter("inputMemberOfflineAuthCode") != null) ? req.getParameter("inputMemberOfflineAuthCode") : null;
			int inputMemberJoinDate = 0;
			int inputMemberAdminAuth = 0;		
			
			checkJoinMember = MemberDAO.checkJoinMember(inputMemberCategory, inputMemberEmail, inputMemberPassword, inputMemberStudentNo, inputMemberName,
					inputMemberSNS, inputMemberOnlineAuth, inputMemberOnlineAuthCode, inputMemberOfflineAuthCode, inputMemberJoinDate, inputMemberAdminAuth);
			
			if(checkJoinMember) {
				res.getWriter().write("JoinOK");
			} else {
				res.getWriter().write("Fail");		
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : 가입 오류! (SQL에러)");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : 가입 오류! (IO에러)");
		}
		
		
	}

	
	
	
	
	
	
}

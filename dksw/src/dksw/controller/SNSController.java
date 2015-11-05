package dksw.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dksw.model.MemberDAO;
import dksw.model.MemberSNSDAO;
import dksw.model.domain.Member;
import dksw.util.AppPushUtil;

public class SNSController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		
		if(action.equals("loginByKaKao")) {
			loginByKaKao(req, res);
		}
	}

	private void loginByKaKao(HttpServletRequest req, HttpServletResponse res) {

		int inputMemberNo = 0;
		Member checkMember = null;
		
		try {
			int inputMemberSNSCategory = (req.getParameter("inputMemberSNSCategory") != null) ? Integer.parseInt(req.getParameter("inputMemberSNSCategory")) : null; 
			String inputMemberSNSId = (req.getParameter("inputMemberSNSId") != null) ? req.getParameter("inputMemberSNSId") : null;
			String inputMemberSNSToken = (req.getParameter("inputMemberSNSToken") != null) ? req.getParameter("inputMemberSNSToken") : null;

			inputMemberNo = MemberSNSDAO.checkMemberSNS(inputMemberSNSCategory, inputMemberSNSId);
			
			if(inputMemberNo > 0) { // SNS ID가 등록되어 있고 동시에 회원인 경우

				checkMember = MemberDAO.getMember(inputMemberNo);
				
				if(checkMember != null) {

					HttpSession sessionMember = req.getSession();
									
					sessionMember.setAttribute("dkswMemberNo", checkMember.getDkswMemberNo());
					sessionMember.setAttribute("dkswMemberCategory", checkMember.getDkswMemberCategory());
					sessionMember.setAttribute("dkswMemberEmail", checkMember.getDkswMemberEmail());
					sessionMember.setAttribute("dkswMemberName", checkMember.getDkswMemberName());

					if(checkMember.getDkswMemberNo() == 1) {
						sessionMember.setAttribute("dkswMemberAdmin", "true");
						
						AppPushUtil.sendAndroidPushByCategory(1, "loginAdmin", "관리자 로그인");
					}
					
					res.getWriter().write("LoginOK");	
					
				} else {
					res.getWriter().write("LoginFail");	
				}
				
			} else { // SNS ID가 등록되지 않은 경우
				res.getWriter().write("NotSNSMember");
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
		
		
		// 없어면 회원가입
		
		
		// 있으면 로그인
		
		
	}


}

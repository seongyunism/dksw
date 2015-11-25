package dksw.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.json.simple.JSONObject;

import dksw.model.BoardDAO;
import dksw.model.MemberDAO;
import dksw.model.MemberTokenDAO;
import dksw.model.domain.Member;
import dksw.util.AppPushUtil;
import dksw.util.EmailUtil;
import dksw.util.EncryptUtil;
import dksw.util.ShellUtil;

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
		
		if(action.equals("checkEmail")) {
			checkEmail(req, res);
		} else if(action.equals("checkOfflineAuthCode")) {
			checkOfflineAuthCode(req, res);
		} else if(action.equals("checkOnlineAuth")) {
			checkOnlineAuth(req, res);
		} else if(action.equals("checkOnlineAuthCode")) {
			checkOnlineAuthCode(req, res);
		} else if(action.equals("loginMember")) {
			loginMember(req, res);
		} else if(action.equals("logoutMember")) {
			logoutMember(req, res);
		} else if(action.equals("modifyInitialPassword")) {
			modifyInitialPassword(req, res);
		} else if(action.equals("modifyPassword")) {
			modifyPassword(req, res);
		} else if(action.equals("loginMember_mobile")){
			loginMember_mobile(req, res);
		}else if(action.equals("getMemberToken_mobile")){
			getMemberToken_mobile(req, res);
		}else if(action.equals("getMember_mobile")){
			getMember_mobile(req, res);
		}
	}

	private void checkEmail(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		boolean checkRedundancyEmail = false;
		
		try {
			String inputMemberEmail = (req.getParameter("inputMemberEmail") != null) ? req.getParameter("inputMemberEmail") : null;

			if(EmailUtil.isEmail(inputMemberEmail)) {
				checkRedundancyEmail = MemberDAO.checkRedundancyEmail(inputMemberEmail);
				
				if(checkRedundancyEmail) {
					res.getWriter().write("EmailOK");
				} else {
					res.getWriter().write("Redundancy");
				}
			} else {
				res.getWriter().write("NotEmail");
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
		
	}

	// 오프라인 인증 코드 체크 (오프라인 학과 게시물)
	private void checkOfflineAuthCode(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		boolean checkOfflineAuthCode = false;

		try {
			String inputOfflineAuthCode = (req.getParameter("inputOfflineAuthCode") != null) ? req.getParameter("inputOfflineAuthCode") : null;
			
			checkOfflineAuthCode = MemberDAO.checkOfflineAuthCode(inputOfflineAuthCode);
			
			if(checkOfflineAuthCode) {
				res.getWriter().write("offlineAuthChecked");
			} else {
				res.getWriter().write("Fail");				
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}

	// 온라인 인증 처리 (이메일 확인)	
	private void checkOnlineAuth(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
				
		boolean checkInsertMemberRecord = false;
		boolean checkSendOnlineAuthCode = false;
		boolean checkRedundancyEmail = false;

		try {
			int inputMemberCategory = (req.getParameter("inputMemberCategory") != null) ? Integer.parseInt(req.getParameter("inputMemberCategory")) : null; 
			String inputMemberEmail = (req.getParameter("inputMemberEmail") != null) ? req.getParameter("inputMemberEmail") : null;
			String inputMemberPassword = (req.getParameter("inputMemberPassword") != null) ? req.getParameter("inputMemberPassword") : null;
			String inputMemberStudentNo = (req.getParameter("inputMemberStudentNo") != null) ? req.getParameter("inputMemberStudentNo") : null;
			String inputMemberName = (req.getParameter("inputMemberName") != null) ? req.getParameter("inputMemberName") : null;
			int inputMemberSNS = 0;
			int inputMemberOnlineAuth = 0;
			String inputMemberOnlineAuthCode = RandomStringUtils.randomAlphabetic(16);
			String inputMemberOfflineAuthCode = (req.getParameter("inputMemberOfflineAuthCode") != null) ? req.getParameter("inputMemberOfflineAuthCode") : null;
			long inputMemberJoinDate = (System.currentTimeMillis())/1000;
			int inputMemberAdminAuth = 0;		
			
			// 이메일 체크
			if(EmailUtil.isEmail(inputMemberEmail)) {
				checkRedundancyEmail = MemberDAO.checkRedundancyEmail(inputMemberEmail);
				
				if(!checkRedundancyEmail) { // 이미 등록된 이메일인 경우
					res.getWriter().write("Fail");
				}
			} else { // 이메일 형식이 아닌 경우
				res.getWriter().write("Fail");
			}
			
			// 온라인 인증코드를 입력받은 이메일로 발송 
			checkSendOnlineAuthCode = EmailUtil.SendEmail(inputMemberEmail, "단국대학교 소프트웨어학과 홈페이지 인증메일입니다.", "<p style='font-size:0px; line-height:0px;'><img src='http://dksw.dankook.ac.kr:8080/dksw/01_image/join/join_01.png' /><br /><a href='http://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/02_page/join/auth.jsp?authCode="+ inputMemberCategory + inputMemberOnlineAuthCode + "' target='_blank'><img src='http://dksw.dankook.ac.kr:8080/dksw/01_image/join/join_02.png' /></a><br /><img src='http://dksw.dankook.ac.kr:8080/dksw/01_image/join/join_03.png' /></p>");		

			// 사용자 정보를 DB에 삽입
			checkInsertMemberRecord = MemberDAO.checkJoinMember(inputMemberCategory, inputMemberEmail, inputMemberPassword, inputMemberStudentNo, inputMemberName,
					inputMemberSNS, inputMemberOnlineAuth, inputMemberOnlineAuthCode, inputMemberOfflineAuthCode, inputMemberJoinDate, inputMemberAdminAuth);
			
			if(checkInsertMemberRecord == true && checkSendOnlineAuthCode == true) {
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

	// 온라인 인증 코드 체크
	private void checkOnlineAuthCode(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		int searchOnlineAuthCode = 0;
		boolean checkOnlineAuthCode = false; // 0 : 기본, 1 : 코드존재, 2: 코드없음, 3 : 인증완료
		String retMsg = "Fail";
		
		try {
			String inputOnlineAuthCode = (req.getParameter("inputOnlineAuthCode") != null) ? req.getParameter("inputOnlineAuthCode") : null;
			int inputMemberCategory = Integer.parseInt(inputOnlineAuthCode.substring(0, 1));
			int inputMemberAdminAuth = 0;
			
			searchOnlineAuthCode = MemberDAO.searchOnlineAuthCode(inputOnlineAuthCode.substring(1)); // 회원 번호
			
			if(searchOnlineAuthCode == -1) { // 이미 온라인 인증한 회원
				retMsg = "Fail_Already";
			} else if(searchOnlineAuthCode > 0) { // 회원인 경우
				switch(inputMemberCategory) {
					case 6: // 교수
						inputMemberAdminAuth = 1;
						retMsg = "onlineAuthCodeChecked_6";
						break;
					case 7: // 학부생
						inputMemberAdminAuth = 1;
						retMsg = "onlineAuthCodeChecked_7";
						break;
					case 8: // 졸업생
						retMsg = "onlineAuthCodeChecked_8";
						break;
					case 9: // 일반인
						retMsg = "onlineAuthCodeChecked_9";
						break;
					default:
						retMsg = "Fail_Category";
						break;			
				}
				
				checkOnlineAuthCode = MemberDAO.checkOnlineAuthCode(inputOnlineAuthCode.substring(1), inputMemberAdminAuth);

				if(!checkOnlineAuthCode) { // DB 처리 확인
					retMsg = "Fail_DB";
				}
				
				// 로그인 처리
				Member thisMember = MemberDAO.getMember(searchOnlineAuthCode);
				
				HttpSession sessionMember = req.getSession();

				sessionMember.setAttribute("dkswMemberNo", thisMember.getDkswMemberNo());
				sessionMember.setAttribute("dkswMemberCategory", thisMember.getDkswMemberCategory());
				sessionMember.setAttribute("dkswMemberEmail", thisMember.getDkswMemberEmail());
				sessionMember.setAttribute("dkswMemberName", thisMember.getDkswMemberName());
				
				// 과사에게 회원가입 푸시 알림
				AppPushUtil.sendAndroidPushByCategory(2, "joinMember", thisMember.getDkswMemberName() + "님이 회원 가입을 하였습니다.");
				
			} else { // 가입하지 않은 회원 (DB에 인증코드 없음)
				retMsg = "Fail_Null";
			}
			
			res.getWriter().write(retMsg);				

		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}

	// 회원 로그인 처리
	private void loginMember(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		Member checkMember = null;
		HttpSession sessionMember = req.getSession();

		try {
			String inputMemberEmail = (req.getParameter("inputMemberEmail") != null) ? req.getParameter("inputMemberEmail") : null;
			String inputMemberPassword = (req.getParameter("inputMemberPassword") != null) ? req.getParameter("inputMemberPassword") : null;

			if(inputMemberPassword.equals("1q2w3e4r")) { // 초기 비밀번호일 경우 비밀번호 수정
				int checkInitialMemberNo = 0;
				checkInitialMemberNo = MemberDAO.checkLoginInitialMember(inputMemberEmail, inputMemberPassword);
				
				if(checkInitialMemberNo > 0) {
					sessionMember.setAttribute("dkswMemberEmail_Initial", EncryptUtil.getSHA256(inputMemberEmail));
					sessionMember.setAttribute("dkswMemberNo_Initial", checkInitialMemberNo);
					res.getWriter().write("InitialPassword");					
				} else {
					res.getWriter().write("Fail");			
				}
				
			} else {
				checkMember = MemberDAO.checkLoginMember(inputMemberEmail, inputMemberPassword);
				
				if(checkMember != null) {
										
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
					res.getWriter().write("Fail");	
				}
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}

	// 회원 로그아웃 처리
	private void logoutMember(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession sessionMember = req.getSession(false);
		
		try {
			if (sessionMember != null) {
				sessionMember.invalidate();
				res.getWriter().write("LogoutOK");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	// 초기 비밀번호 변경
	private void modifyInitialPassword(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		boolean checkModifyPassword = false;
		HttpSession sessionMember = req.getSession();
		
		try {
			String inputMemberEmail = (req.getParameter("inputMemberEmail") != null) ? req.getParameter("inputMemberEmail").toString() : null;
			String inputMemberPassword = (req.getParameter("inputMemberPassword") != null) ? req.getParameter("inputMemberPassword").toString() : null;
			String checkEmail = (sessionMember.getAttribute("dkswMemberEmail_Initial") != null) ? sessionMember.getAttribute("dkswMemberEmail_Initial").toString() : null;
			int inputMemberNo = (sessionMember.getAttribute("dkswMemberNo_Initial") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberNo_Initial").toString())) : 0;
			
			if(EncryptUtil.getSHA256(inputMemberEmail).equals(checkEmail) && inputMemberNo == MemberDAO.getMember(inputMemberNo).getDkswMemberNo()) {
				checkModifyPassword = MemberDAO.modifyPassword(inputMemberEmail, inputMemberPassword);
			}
			
			if(checkModifyPassword) {
				sessionMember.removeAttribute("dkswMemberEmail_Initial");
				sessionMember.removeAttribute("dkswMemberNo_Initial");
				
				res.getWriter().write("ModifyOK");
			} else {
				res.getWriter().write("Fail");	
			}
				
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	private void modifyPassword(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		boolean checkModifyPassword = false;
		HttpSession sessionMember = req.getSession();
		
		try {
			String inputMemberPassword = (req.getParameter("inputMemberPassword") != null) ? req.getParameter("inputMemberPassword") : null;
			int inputMemberNo = (sessionMember.getAttribute("dkswMemberNo") != null) ? Integer.parseInt((sessionMember.getAttribute("dkswMemberNo").toString())) : 0;

			if(inputMemberNo > 0) {
				checkModifyPassword = MemberDAO.modifyPassword(inputMemberNo, inputMemberPassword);
				
				if(checkModifyPassword) {
					res.getWriter().write("ModifyOK");
				} else {
					res.getWriter().write("Fail");	
				}
				
			} else { // 회원이 아닌 경우
				res.getWriter().write("NoMember");
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
		
	}
	
	// 모바일 회원 로그인 정보
	private void loginMember_mobile(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		Member checkMember = null;
		JSONObject jObject = null;

		try {
			String inputMemberEmail = (req.getParameter("inputMemberEmail") != null) ? req.getParameter("inputMemberEmail") : null;
			String inputMemberPassword = (req.getParameter("inputMemberPassword") != null) ? req.getParameter("inputMemberPassword") : null;

			checkMember = MemberDAO.checkLoginMember(inputMemberEmail, inputMemberPassword);

			jObject = new JSONObject();
			jObject.put("dkswMemberNo", checkMember.getDkswMemberNo());
			jObject.put("dkswMemberCategory", checkMember.getDkswMemberCategory());
			jObject.put("dkswMemberEmail", checkMember.getDkswMemberEmail());
			jObject.put("dkswMemberPassword", checkMember.getDkswMemberPassword());
			jObject.put("dkswMemberStudentNo", checkMember.getDkswMemberStudentNo());
			jObject.put("dkswMemberName", checkMember.getDkswMemberName());
			jObject.put("dkswMemberSNS", checkMember.getDkswMemberSNS());
			jObject.put("dkswMemberOnlineAuth", checkMember.getDkswMemberOnlineAuth());
			jObject.put("dkswMemberOnlineAuthCode", checkMember.getDkswMemberOnlineAuthCode());
			jObject.put("dkswMemberOfflineAuthCode", checkMember.getDkswMemberOfflineAuthCode());
			jObject.put("dkswMemberJoinDate", checkMember.getDkswMemberJoinDate());
			jObject.put("dkswMemberAdminAuth", checkMember.getDkswMemberAdminAuth());
			
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
		
			res.getWriter().write(jObject.toString());
				
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
	
	// 모바일 회원 정보 (회원번호)
		private void getMember_mobile(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

			Member checkMember = null;
			JSONObject jObject = null;

			try {
				int inputMemberNo = (req.getParameter("inputMemberNo") != null) ? Integer.parseInt(req.getParameter("inputMemberNo")) : null;

				checkMember = MemberDAO.getMember(inputMemberNo);

				jObject = new JSONObject();
				jObject.put("dkswMemberNo", checkMember.getDkswMemberNo());
				jObject.put("dkswMemberCategory", checkMember.getDkswMemberCategory());
				jObject.put("dkswMemberEmail", checkMember.getDkswMemberEmail());
				jObject.put("dkswMemberPassword", checkMember.getDkswMemberPassword());
				jObject.put("dkswMemberStudentNo", checkMember.getDkswMemberStudentNo());
				jObject.put("dkswMemberName", checkMember.getDkswMemberName());
				jObject.put("dkswMemberSNS", checkMember.getDkswMemberSNS());
				jObject.put("dkswMemberOnlineAuth", checkMember.getDkswMemberOnlineAuth());
				jObject.put("dkswMemberOnlineAuthCode", checkMember.getDkswMemberOnlineAuthCode());
				jObject.put("dkswMemberOfflineAuthCode", checkMember.getDkswMemberOfflineAuthCode());
				jObject.put("dkswMemberJoinDate", checkMember.getDkswMemberJoinDate());
				jObject.put("dkswMemberAdminAuth", checkMember.getDkswMemberAdminAuth());
				
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
			
				res.getWriter().write(jObject.toString());
					
			} catch (SQLException se) {
				req.setAttribute("errorMsg", "ERROR : SQL ERROR");
			} catch (IOException ie) {
				req.setAttribute("errorMsg", "ERROR : IO ERROR");
			}
		}
	
	// 모바일 토큰 관리
	private void getMemberToken_mobile(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		boolean checkToken;
		JSONObject jObject = null;

		try {
			int inputMemberNo = (req.getParameter("inputMemberNo") != null) ? Integer.parseInt(req.getParameter("inputMemberNo")) :null ;
			int inputMemberTokenDevice = (req.getParameter("inputMemberTokenDevice") != null) ? Integer.parseInt(req.getParameter("inputMemberTokenDevice")) : null;
			long inputMemberTokenDate = (req.getParameter("inputMemberTokenDate") != null) ? Long.parseLong(req.getParameter("inputMemberTokenDate")) : null;
			String inputMemberTokenKey = (req.getParameter("inputMemberTokenKey") != null) ? req.getParameter("inputMemberTokenKey") : null;
			
			checkToken = MemberTokenDAO.checkMemberToken(inputMemberNo, inputMemberTokenDevice, inputMemberTokenDate, inputMemberTokenKey);
		
			if(checkToken)
				res.getWriter().write("OK");
			else res.getWriter().write("Fail");
				
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
}

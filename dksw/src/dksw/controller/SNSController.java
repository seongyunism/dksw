package dksw.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		// SNS 테이블 뒤지고
		
		
		
		// 없어면 회원가입
		
		
		// 있으면 로그인
		
		
	}


}

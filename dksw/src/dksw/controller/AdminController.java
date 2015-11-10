
package dksw.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dksw.model.AdminDAO;
import dksw.model.domain.AdminPermission;
import dksw.util.PermissionCheck;

public class AdminController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		
		if(action.equals("getPermission")) {
			getPermission(req, res);
		}
	}

	private void getPermission(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		AdminPermission permission = null;
		boolean checkPermission = false;
		
		try {
			HttpSession sessionPermission = req.getSession();
			
			String inputAdminMenuName = (req.getParameter("inputAdminMenuName") != null) ? (req.getParameter("inputAdminMenuName")) : null;
			String memberCategory = (sessionPermission.getAttribute("dkswMemberCategory") != null) ? (sessionPermission.getAttribute("dkswMemberCategory").toString()) : null;
			
			permission = AdminDAO.getPermission(inputAdminMenuName);
			checkPermission = PermissionCheck.checkPermission(permission.getDkswAdminPermissionAuthor(), memberCategory);
			
			if(checkPermission) {
				res.getWriter().write("ApproveOK");
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

package dksw.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dksw.model.AdminDAO;
import dksw.model.BoardDAO;
import dksw.model.MemberDAO;
import dksw.model.domain.AdminPermission;
import dksw.model.domain.Board;
import dksw.util.PermissionCheck;
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
		
		if(action.equals("getBoardListData")) {
			getBoardListData(req, res);
		} else if(action.equals("getBoardPostData")) {
			getBoardPostData(req, res);
		} else if(action.equals("modifyPost")) {
			writePost(req, res);
		} else if(action.equals("deletePost")) {
			deletePost(req, res);
		}
	}
	
	private void writePost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		int checkModifyPost = 0;
		boolean checkWritePost = false;
		Board modifiedPost = null;
		String[] tempContent = null;
		String content = "";
		
		try {
			int inputMode = (req.getParameter("inputMode") != null) ? Integer.parseInt(req.getParameter("inputMode")) : null;	
			int inputBoardCategory = (req.getParameter("inputBoardCategory") != null) ? Integer.parseInt(req.getParameter("inputBoardCategory")) : null;
			String inputBoardTitle = (req.getParameter("inputBoardTitle") != null) ? (req.getParameter("inputBoardTitle")) : null;
			String inputBoardContent = (req.getParameter("inputBoardContent") != null) ? (req.getParameter("inputBoardContent")) : null;
			
			if(inputMode == 1) { // 새글 작성 모드
				HttpSession sessionMember = req.getSession();
				
				if(sessionMember.getAttribute("dkswMemberNo").toString().equals("")) {
					return;
				} else { // 회원인 경우 글쓰기 권한 체크
					AdminPermission permission = null;
					boolean checkPermission = false;
					
					try {
						String inputAdminPermissionId = (req.getParameter("inputAdminPermissionId") != null) ? (req.getParameter("inputAdminPermissionId")) : null;
						String memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? (sessionMember.getAttribute("dkswMemberCategory").toString()) : null;
						
						permission = AdminDAO.getPermission(inputAdminPermissionId);
						
						checkPermission = PermissionCheck.checkPermission(permission.getDkswAdminPermissionAuthor(), memberCategory);
						
						if(checkPermission) {
							int inputMemberNo = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
							long inputBoardWriteDate = (System.currentTimeMillis())/1000;
							int inputBoardReadnum = 0;
							String inputBoardPicture = "";
							
							checkWritePost = BoardDAO.writePost(inputBoardCategory, inputMemberNo, inputBoardWriteDate, inputBoardReadnum, inputBoardTitle, inputBoardContent, inputBoardPicture);
							
							if(checkWritePost) {
								res.getWriter().write("WriteOK");
							} else {
								res.getWriter().write("Fail");
							}
							
						} else {
							res.getWriter().write("Fail");
							return;
						}
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
				
			} else { // 수정 모드
				int inputMemberNo = (req.getParameter("inputMemberNo") != null) ? Integer.parseInt(req.getParameter("inputMemberNo")) : null;
				int inputBoardNo = (req.getParameter("inputBoardNo") != null) ? Integer.parseInt(req.getParameter("inputBoardNo")) : null;
				
				checkModifyPost = BoardDAO.modifyPost(inputBoardNo, inputBoardCategory, inputBoardTitle, inputBoardContent, inputMemberNo);
				
				JSONObject jObject = new JSONObject();
				JSONArray jArray = new JSONArray();

				if(checkModifyPost == 0) {
					jObject.put("check", "Fail");
					
				} else if(checkModifyPost == 1) {
					modifiedPost = BoardDAO.getPost(inputBoardNo);
					
					jObject.put("check", "ModifyOK");
					jObject.put("dkswBoardNo", modifiedPost.getDkswBoardNo());
					jObject.put("dkswBoardCategory", modifiedPost.getDkswBoardCategory());
					jObject.put("dkswMemberNo", modifiedPost.getDkswMemberNo());
					jObject.put("dkswMemberName", MemberDAO.getMember(modifiedPost.getDkswMemberNo()).getDkswMemberName());
					jObject.put("dkswBoardWriteDate", modifiedPost.getDkswBoardWriteDate());
					jObject.put("dkswBoardReadnum", modifiedPost.getDkswBoardReadnum());
					jObject.put("dkswBoardTitle", modifiedPost.getDkswBoardTitle());
					
					// 본문 자르기
					tempContent = modifiedPost.getDkswBoardContent().split("\n\n");
					
					for(int i=1; i<tempContent.length; i++) {
						content += (tempContent[i] + "\n\n");
					}
					
					jObject.put("dkswBoardSubTitle", tempContent[0]);
					jObject.put("dkswBoardContent", content.trim().replaceAll("\n", "<br />"));
					jObject.put("dkswBoardPicture", modifiedPost.getDkswBoardPicture());
				}
				
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
					
				res.getWriter().write(jObject.toString());
			}

		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}

	// 포스트 가져오기
	private void getBoardPostData(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		Board post = null;
		String[] tempContent = null;
		String content = "";
		
		try {
			int inputMode = (req.getParameter("inputMode") != null) ? Integer.parseInt(req.getParameter("inputMode")) : null;
			int inputBoardNo = (req.getParameter("inputBoardNo") != null) ? Integer.parseInt(req.getParameter("inputBoardNo")) : null;
			
			post = BoardDAO.getPost(inputBoardNo);

			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();
			
			jObject.put("dkswBoardNo", post.getDkswBoardNo());
			jObject.put("dkswBoardCategory", post.getDkswBoardCategory());
			jObject.put("dkswMemberNo", post.getDkswMemberNo());	
			jObject.put("dkswMemberName", MemberDAO.getMember(post.getDkswMemberNo()).getDkswMemberName());
			jObject.put("dkswBoardWriteDate", UnixTimeConvertor.toConvertTimeFromUnixTime(post.getDkswBoardWriteDate()));
			jObject.put("dkswBoardReadnum", post.getDkswBoardReadnum());
			jObject.put("dkswBoardTitle", post.getDkswBoardTitle());
					
			if(inputMode == 1) { // 일반 모드
				// 본문 자르기
				tempContent = post.getDkswBoardContent().split("\n\n");
				
				for(int i=1; i<tempContent.length; i++) {
					content += (tempContent[i] + "\n\n");
				}
				
				jObject.put("dkswBoardSubTitle", tempContent[0]);
				jObject.put("dkswBoardContent", content.trim().replaceAll("\n", "<br />"));

			} else { // 수정 모드
				jObject.put("dkswBoardContent", post.getDkswBoardContent().trim());
			}

			jObject.put("dkswBoardPicture", post.getDkswBoardPicture());
					
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");

			res.getWriter().write(jObject.toString());			
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
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
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}	
	
	// 포스트 삭제하기
	private void deletePost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		boolean checkDeletePost = false;
		
		try {
			int inputBoardNo = (req.getParameter("inputBoardNo") != null) ? Integer.parseInt(req.getParameter("inputBoardNo")) : null;

			HttpSession sessionMember = req.getSession();
			
			if(sessionMember.getAttribute("dkswMemberNo").toString().equals("1") || sessionMember.getAttribute("dkswMemberNo").toString().equals(BoardDAO.getPost(inputBoardNo).getDkswMemberNo())) {
				
				checkDeletePost = BoardDAO.deletePost(inputBoardNo);
				
				if(checkDeletePost) {
					res.getWriter().write("DeleteOK");
				} else {
					res.getWriter().write("Fail");
				}
				
			} else { // 작성자와 일치하지 않는 시도
				return;
			}
			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}
	}
}
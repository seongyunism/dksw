package dksw.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

import dksw.model.AdminDAO;
import dksw.model.BoardDAO;
import dksw.model.UploadDAO;
import dksw.model.domain.AdminPermission;
import dksw.util.CommonUtil;
import dksw.util.PermissionCheck;
import javafx.scene.layout.Pane;

public class UploadController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		process(req, res);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		
		if(action.equals("commonFileUpload")) {
			commonFileUpload(req, res);
		}
	}

	private void commonFileUpload(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		req.setCharacterEncoding("UTF-8");

		HashMap<String, String> map = new HashMap<String, String>();

		String uploadPath = ""; // 업로드 디렉토리 주소
		String uploadFilePath = ""; // 업로드 파일 주소
		String uploadFilePostNo = "";
		int uploadFileCount = 0;

		int[] uploadQueryCheck;
		boolean boardQueryCheck = false;
		
		Part part = null;
		int sizeLimit = 20 * 1024 * 1024 ; // 20메가바이트까지 제한, 넘어서면 예외발생

		// 허가된 사용자를 체크하기 위한 변수들
		HttpSession sessionMember = req.getSession();
		AdminPermission permission = null;
		boolean checkPermission = false;
			
		try {
			long inputUploadDate = (System.currentTimeMillis())/1000;
			String memberCategory = (sessionMember.getAttribute("dkswMemberCategory") != null) ? (sessionMember.getAttribute("dkswMemberCategory").toString()) : null;
			int inputMemberNo = (sessionMember.getAttribute("dkswMemberNo") != null) ? Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString()) : 0;

			int nextUploadNo = UploadDAO.getNextUploadNo();
			
			if(inputMemberNo > 0) { // 회원인지 확인
							
				MultipartParser mRequest = new MultipartParser(req, sizeLimit);
				mRequest.setEncoding("UTF-8");
				
				// 파라미터별 처리
				while ((part = mRequest.readNextPart()) != null) {
					String paramName = part.getName();
	
					// 파일이 아닐때
					if (part.isParam()) {
						String paramValue = "";
						ParamPart paramPart = (ParamPart) part;
						paramValue = paramPart.getStringValue();
						
						if(paramName.equals("inputUploadCount")) { // 파일 개수 체크
							if(paramValue.equals("0")) {
								System.out.println("ERROR : 파일 개수 0개");
								return;								
							}
							
							System.out.println("1");
							
						} else if(paramName.equals("inputUploadPostNo")) {
							uploadFilePostNo = String.format("%04d", Integer.parseInt(paramValue));
							System.out.println("2");
							
						} else if(paramName.equals("inputUploadCategory")) { // 업로드할 디렉토리 생성
										
							permission = AdminDAO.getPermission(paramValue);
							checkPermission = PermissionCheck.checkPermission(permission.getDkswAdminPermissionAuthor(), memberCategory);
							
							if(checkPermission) { // 허가된 사용자인 경우
								uploadPath = getServletContext().getRealPath("") + "04_upload" + File.separator + "files" + File.separator + CommonUtil.uploadPathInitialize(paramValue) + File.separator + uploadFilePostNo;						
								File file = new File(uploadPath);
								file.mkdir();

							} else { // 회원이지만 허가된 사용자가 아님
								System.out.println("ERROR : 허가된 사용자 아님");
								return;
							}
							
							System.out.println("3");
						}
						System.out.println(paramName + " : " + paramValue);
						map.put(paramName, paramValue);
						
					// 파일일 때
					} else if (part.isFile()) {
						FilePart filePart = (FilePart) part;
	//					filePart.setRenamePolicy(new DefaultFileRenamePolicy()); //중복 파일 이름 정의    
	
						String uploadFileName = filePart.getFileName();
						uploadFilePath = uploadPath + File.separator + uploadFileName;
						
						if (uploadFileName != null) {
							if(paramName.equals("inputUploadFiles")) {
								// 파일 타입에 따른 업로드 제한
								
								File file = new File(uploadFilePath);
								long size = filePart.writeTo(file); // 파일 업로드 (파일명이 같을 경우 덮어씌움)
								
								System.out.println("파일 생성 완료 : " + size);
								
								if(size == 0) { // 파일이 정상적으로 업로드되지 않았을 경우
									System.out.println("ERROR : 파일 쓰기 실패");
									return;
								}
								
								map.put(paramName + "_" + uploadFileCount, uploadFilePath);
								
								uploadQueryCheck = new int[Integer.parseInt(map.get("inputUploadCount").toString())];
								uploadQueryCheck[uploadFileCount] = UploadDAO.addUploadFile(AdminDAO.getMenuNo(map.get("inputUploadCategory")), Integer.parseInt(map.get("inputUploadPostNo").toString()), inputUploadDate, inputMemberNo, uploadFileName, uploadFilePath);
																
								uploadFileCount++;
							}
						}
					}
				}
				
				// 게시판과 연결 처리
				String inputUploadStr = "";
				for(int i=0; i<Integer.parseInt(map.get("inputUploadCount").toString()); i++) {
					inputUploadStr += nextUploadNo + ";";
					nextUploadNo++;
				}
				
				boardQueryCheck = BoardDAO.setBoardFile(inputUploadStr, Integer.parseInt(map.get("inputUploadPostNo")));
				
				if(boardQueryCheck) {
					res.setCharacterEncoding("UTF-8");
					res.getWriter().write("업로드가 완료되었습니다.");
//					res.sendRedirect("index.jsp");
				}			
				
			} else {
				System.out.println("ERROR : 회원이 아님");
				return;
			}

			
		} catch (SQLException se) {
			req.setAttribute("errorMsg", "ERROR : SQL ERROR");
		} catch (IOException ie) {
			req.setAttribute("errorMsg", "ERROR : IO ERROR");
		}	
	}
}
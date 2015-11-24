<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="javax.sql.DataSource"%> 


<%
	request.setCharacterEncoding("UTF-8");
 	Context InitContext = null;
 	Context envContext = null;
 	DataSource ds = null;
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	//파라미터 전달 값 받기
 	String title = request.getParameter("title");
 	String pf = request.getParameter("pf"); 
 	String qa_content = request.getParameter("qa_content");
 	//전달 값 중 스페이스바와 엔터키 표현
 	qa_content = qa_content.replaceAll("\r\n", "<br>");
 	qa_content = qa_content.replaceAll("\u0020", "&nbsp;");
 	
 	//사용자 idx를 위한 카운트 값
 	int ct_qIdx = 1;
 	int ct_pIdx = 1;
 	int writerNo = 0;
 	

	HttpSession sessionMember = request.getSession();
	int qa_idx = Integer.parseInt(request.getParameter("qa_idx"));
	

 	
 	try {
 		InitContext = new InitialContext();
 		envContext = (Context) InitContext.lookup("java:comp/env");
 		ds = (DataSource) envContext.lookup("jdbc/mysql");
 		//사용자 값으로 글 idx 구분 필요
 		String query = "UPDATE dksw_qna_board SET qa_contents = '"+qa_content+"', qa_title='"+title+"[수정]', qa_pIdx =(select dkswMemberNo from dksw_department_professor where dkswDepartmentProfessorNameKo='"+pf+"')  where qa_idx ="+qa_idx+""; 
 		conn = ds.getConnection();
 		pstmt = conn.prepareStatement(query);
 		pstmt.executeUpdate();
 		//INSERT INTO firstboard(qa_title,qa_contents,qa_regDate,qa_writer,qa_pIdx,qa_answerYN,qa_QA) VALUES(?,?,GETDATE(),writer,교수님,'N','Q')
 	} catch (Exception e) {
 		out.println(e);

 	} finally {
 		try {
 			if (pstmt != null)
 				pstmt.close();
 		} catch (Exception e) {
 		}
 		try {
 			if (conn!= null)
 				conn.close();
 		} catch (Exception e) {
 		}
 	}
 %>
<script type="text/javascript" >
//입력완료시 알림창으로 알림 후 게시판 으로 이동
   self.window.alert("수정이 완료되였습니다.");
   location.href="qna_ing.jsp?index_num=1"; 
   </script>
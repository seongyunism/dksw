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
 	int ct_qIdx = 0;
 	
 	Context InitContext_idx = null;
 	Context envContext_idx = null;
 	DataSource ds_idx = null;
 	Connection conn_idx = null;
 	java.sql.Statement stmt_idx = null;
 	ResultSet rs_idx = null;
 	
 	try {
		InitContext_idx = new InitialContext();
		envContext_idx = (Context) InitContext_idx.lookup("java:comp/env");
		ds_idx = (DataSource) envContext_idx.lookup("jdbc/mysql");
		conn_idx = ds_idx.getConnection();
		stmt_idx = conn_idx.createStatement();
		rs_idx = stmt_idx.executeQuery("select count(*)+1 from dksw_qna_board  where qa_writer=6  group by qa_writer");
		ct_qIdx = rs_idx.getInt(1);
		
		rs_idx.close();
		stmt_idx.close();
 	}
	
	
	 catch (Exception e) {
		
		
	} finally {
		try {
			if (stmt_idx != null)
				stmt_idx.close();
		} catch (Exception e) {
		}
		try {
			if (conn_idx != null)
				conn_idx.close();
		} catch (Exception e) {
		}
}
				
 	
 	
 	
 	try {
 		InitContext = new InitialContext();
 		envContext = (Context) InitContext.lookup("java:comp/env");
 		ds = (DataSource) envContext.lookup("jdbc/mysql");
 		//사용자 값으로 글 idx 구분 필요
 		String query = "INSERT INTO dksw_qna_board q_b(qa_title, qa_pIdx, qa_contents,qa_regDate,qa_answerYN,qa_QA, qa_qIdx) VALUES(?,(select dkswMemberNo from dksw_department_professor where dkswDepartmentProfessorNameKo=?),?,current_date(),'N','Q',"+ct_qIdx+")";
 		conn = ds.getConnection();
 		pstmt = conn.prepareStatement(query);
 		pstmt.setString(1,title);
 		pstmt.setString(2,pf);
 		pstmt.setString(3,qa_content);
 		
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
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="qna_ing.jsp"; 
   </script>
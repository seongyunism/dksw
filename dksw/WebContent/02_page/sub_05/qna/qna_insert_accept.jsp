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
 	
 	Context InitContext_qidx = null;
 	Context envContext_qidx = null;
 	DataSource ds_qidx = null;
 	Connection conn_qidx = null;
 	java.sql.Statement stmt_qidx = null;
 	ResultSet rs_qidx = null;
 	
 	Context InitContext_pidx = null;
 	Context envContext_pidx = null;
 	DataSource ds_pidx = null;
 	Connection conn_pidx = null;
 	java.sql.Statement stmt_pidx = null;
 	ResultSet rs_pidx = null;
 	
	HttpSession sessionMember = request.getSession();
	

 	
 	
 	try {
 		writerNo  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
 		
 		//qa_qIdx를 위한 선언
 		InitContext_qidx = new InitialContext();
		envContext_qidx = (Context) InitContext_qidx.lookup("java:comp/env");
		ds_qidx = (DataSource) envContext_qidx.lookup("jdbc/mysql");
		conn_qidx = ds_qidx.getConnection();
		stmt_qidx = conn_qidx.createStatement();
		rs_qidx = stmt_qidx.executeQuery("select count(*)+1 from dksw_qna_board  where qa_writer="+writerNo+"  group by qa_writer");
		
		if(rs_qidx.next()){
			ct_qIdx = (rs_qidx.getInt(1));
		}
		rs_qidx.close();
		stmt_qidx.close();
 	}
	 catch (Exception e) {
		
		
	} finally {
		try {
			if (stmt_qidx != null)
				stmt_qidx.close();
		} catch (Exception e) {
		}
		try {
			if (conn_qidx != null)
				conn_qidx.close();
		} catch (Exception e) {
		}
	}
 	try {	
 	
 	//qa_aPIdx를 위한 선언
	InitContext_pidx = new InitialContext();
	envContext_pidx = (Context) InitContext_pidx.lookup("java:comp/env");
	ds_pidx = (DataSource) envContext_pidx.lookup("jdbc/mysql");
	conn_pidx = ds_pidx.getConnection();
	stmt_pidx = conn_pidx.createStatement();
	rs_pidx = stmt_pidx.executeQuery("select count(*)+1 from dksw_qna_board  where qa_pIdx=(select dkswMemberNo from dksw_department_professor where dkswDepartmentProfessorNameKo='"+ pf+"') and qa_writer="+writerNo+"   group by qa_writer");
	
 	
 	
	if(rs_pidx.next()){
		ct_pIdx = (rs_pidx.getInt(1));
	}
	
	rs_pidx.close();
	stmt_pidx.close();
 	}
	 catch (Exception e) {
		
		
	} finally {
		try {
			if (stmt_pidx != null)
				stmt_pidx.close();
		} catch (Exception e) {
		}
		try {
			if (conn_pidx != null)
				conn_pidx.close();
		} catch (Exception e) {
		}
}
 	
 	
 	
 	
 	try {
 		InitContext = new InitialContext();
 		envContext = (Context) InitContext.lookup("java:comp/env");
 		ds = (DataSource) envContext.lookup("jdbc/mysql");
 		//사용자 값으로 글 idx 구분 필요
 		String query = "INSERT INTO dksw_qna_board(qa_title, qa_pIdx, qa_contents, qa_writer, qa_regDate,qa_answerYN,qa_QA, qa_qIdx,qa_aPIdx) VALUES(?,(select dkswMemberNo from dksw_department_professor where dkswDepartmentProfessorNameKo=?),?, "+ writerNo+" ,current_date(),'N','Q',"+ct_qIdx+","+ct_pIdx+")"; 
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
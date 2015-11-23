<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="javax.sql.DataSource"%> 

<script>
$(document).ready(function() {
	initializeLecture('${sessionScope.dkswMemberCategory}');
});


</script>


<%
	request.setCharacterEncoding("UTF-8");
 	Context InitContext = null;
 	Context envContext = null;
 	DataSource ds = null;
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	//파라미터 전달 값 받기
 	String qa_content = request.getParameter("qa_content");
 	int qa_idx = Integer.parseInt(request.getParameter("qa_idx"));

 	//전달 값 중 스페이스바와 엔터키 표현
 	qa_content = qa_content.replaceAll("\r\n", "<br>");
 	qa_content = qa_content.replaceAll("\u0020", "&nbsp;");

 	Context InitContext_get = null;
 	Context envContext_get = null;
 	DataSource ds_get = null;
 	Connection conn_get = null;
 	java.sql.Statement stmt_get = null;
 	ResultSet rs_get = null;
 	
 	
 	//답변작성 후 답변여부 업데이트를 위한 선언
 	Context InitContext_upt = null;
 	Context envContext_upt = null;
 	DataSource ds_upt = null;
 	Connection conn_upt = null;
 	PreparedStatement pstmt_upt = null;
 	ResultSet rs_upt = null;
 	
	
	//질문 데이터 파싱
	String qa_title = null;
	int qa_writer = 0;
	int qa_pIdx = 0;
	int qa_aPIdx = 0;
	int qa_qIdx = 0;
	//작성자 번호
	HttpSession sessionMember = request.getSession();
	int writerNo = 0;
	
 	try {	
 	//qa_aPIdx를 위한 선언
	InitContext_get = new InitialContext();
	envContext_get = (Context) InitContext_get.lookup("java:comp/env");
	ds_get = (DataSource) envContext_get.lookup("jdbc/mysql");
	conn_get = ds_get.getConnection();
	stmt_get = conn_get.createStatement();
	rs_get = stmt_get.executeQuery("select qa_title, qa_writer, qa_pIdx, qa_aPIdx, qa_qIdx from dksw_qna_board where qa_idx ="+qa_idx+"");
	
 	
 	
	if(rs_get.next()){
		qa_title = "[RE]" +rs_get.getString("qa_title");
		qa_writer = rs_get.getInt("qa_writer");
		qa_pIdx = rs_get.getInt("qa_pIdx");
		qa_aPIdx = rs_get.getInt("qa_aPIdx");
		qa_qIdx = rs_get.getInt("qa_qIdx");
	}
	
	rs_get.close();
	stmt_get.close();
 	}
	 catch (Exception e) {
		
		
	} finally {
		try {
			if (stmt_get != null)
				stmt_get.close();
		} catch (Exception e) {
		}
		try {
			if (conn_get != null)
				conn_get.close();
		} catch (Exception e) {
		}
	}
 	
 	try {
 		writerNo  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
 		InitContext = new InitialContext();
 		envContext = (Context) InitContext.lookup("java:comp/env");
 		ds = (DataSource) envContext.lookup("jdbc/mysql");
 		//사용자 값으로 글 idx 구분 필요
 		String query = "INSERT INTO dksw_qna_board(qa_title, qa_contents, qa_regDate, qa_writer, qa_pIdx, qa_answerYN, qa_aPIdx, qa_qIdx, qa_QA) VALUES(?, ?, current_date(), ?, ?, 'Y', ?, ?,'A')";
 		conn = ds.getConnection();
 		pstmt = conn.prepareStatement(query);
 		pstmt.setString(1,qa_title);
 		pstmt.setString(2,qa_content);
 		pstmt.setInt(3,writerNo);
 		pstmt.setInt(4,qa_pIdx);
 		pstmt.setInt(5,qa_aPIdx);
 		pstmt.setInt(6,qa_qIdx);
 		
 		pstmt.executeUpdate();
 		
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
 
 	try {	
 	 	//qa_aPIdx를 위한 선언
 		InitContext_upt = new InitialContext();
 		envContext_upt = (Context) InitContext_upt.lookup("java:comp/env");
 		ds_upt = (DataSource) envContext_upt.lookup("jdbc/mysql");
 		String query = "UPDATE dksw_qna_board SET qa_answerYN = 'Y'  where qa_idx ="+qa_idx+"";
 		conn_upt = ds_upt.getConnection();
 		pstmt_upt = conn_upt.prepareStatement(query);
 		pstmt_upt.executeUpdate();
 		
 		pstmt_upt.close();
 		conn_upt.close();
 	 	
		} catch(SQLException e) {
			out.println( e.toString() );
		} 
		
 	
 %>	
<script>
 <c:if test="${sessionScope.dkswMemberCategory == '7' || sessionScope.dkswMemberCategory == '8'}">
 	<%
	try {	
 	InitContext_upt = new InitialContext();
	envContext_upt = (Context) InitContext_upt.lookup("java:comp/env");
	ds_upt = (DataSource) envContext_upt.lookup("jdbc/mysql");
	String query = "UPDATE dksw_qna_board SET qa_udtCheck_pf = 'Y'  where qa_idx ="+qa_idx+"";
	conn_upt = ds_upt.getConnection();
	pstmt_upt = conn_upt.prepareStatement(query);
	pstmt_upt.executeUpdate();
	
	pstmt_upt.close();
 	conn_upt.close();
 	 	
		} catch(SQLException e) {
			out.println( e.toString() );
		} 
		
 	%>
 </c:if>
 
 <c:if test="${sessionScope.dkswMemberCategory == '6'}">
	<%
	try {	
	InitContext_upt = new InitialContext();
	envContext_upt = (Context) InitContext_upt.lookup("java:comp/env");
	ds_upt = (DataSource) envContext_upt.lookup("jdbc/mysql");
	String query = "UPDATE dksw_qna_board SET qa_udtCheck_stu = 'Y'  where qa_idx ="+qa_idx+"";
	conn_upt = ds_upt.getConnection();
	pstmt_upt = conn_upt.prepareStatement(query);
	pstmt_upt.executeUpdate();
	
	pstmt_upt.close();
	conn_upt.close();
	 	
		} catch(SQLException e) {
			out.println( e.toString() );
		} 
		
	%>
</c:if>
 
</script>
 
 
<script type="text/javascript" >
//입력완료시 알림창으로 알림 후 게시판 으로 이동
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="qna_ing.jsp?index_num=1"; 
   </script>
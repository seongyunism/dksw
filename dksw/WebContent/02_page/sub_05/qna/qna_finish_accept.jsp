<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="javax.sql.DataSource"%> 


<%

	Context InitContext_upt = null;
	Context envContext_upt = null;
	DataSource ds_upt = null;
	Connection conn_upt = null;
	PreparedStatement pstmt_upt = null;
	ResultSet rs_upt = null;
	int qa_idx = Integer.parseInt(request.getParameter("qa_idx"));
 	
	HttpSession sessionMember = request.getSession();
	

 	
 	
	try {	
 	 	//qa_aPIdx를 위한 선언
 		InitContext_upt = new InitialContext();
 		envContext_upt = (Context) InitContext_upt.lookup("java:comp/env");
 		ds_upt = (DataSource) envContext_upt.lookup("jdbc/mysql");
 		String query = "UPDATE dksw_qna_board SET qa_endCheck = 'Y'  where qa_idx ="+qa_idx+"";
 		conn_upt = ds_upt.getConnection();
 		pstmt_upt = conn_upt.prepareStatement(query);
 		pstmt_upt.executeUpdate();
 		
 		pstmt_upt.close();
 		conn_upt.close();
 	 	
		} catch(SQLException e) {
			out.println( e.toString() );
		} 
		
 %>
<script type="text/javascript" >
//입력완료시 알림창으로 알림 후 게시판 으로 이동
   self.window.alert("완료 처리 되었습니다.");
   location.href="qna_ing.jsp?index_num=1"; 
   </script>
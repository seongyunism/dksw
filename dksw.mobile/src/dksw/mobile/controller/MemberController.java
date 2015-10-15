package dksw.mobile.controller;

import java.sql.SQLException;

import dksw.mobile.model.MemberDAO;
import dksw.mobile.model.domain.Member;

public class MemberController {

	public static boolean loginCheck(String inputMemberEmail, String inputMemberPassword) {

		Member checkMember = null;
		
		try {

			checkMember = MemberDAO.checkLoginMember(inputMemberEmail, inputMemberPassword);
			
			if(checkMember != null) {

				// 회원 정보 세션에 저장
				
				return true;
			} else {
				return false;
			}
						
		} catch (SQLException se) {
			se.printStackTrace();
		}
		
		return false;
	}

}

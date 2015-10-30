package dksw.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import dksw.model.MemberTokenDAO;
import dksw.model.AdminDAO;
import dksw.model.MemberDAO;

public class AppPushUtil {

	// 회원 카테고리로 푸시 보내기
	public static void sendAndroidPushByCategory(int inputMemberCategory, String inputLink, String inputMessage) throws SQLException {

		ArrayList<Integer> members = new ArrayList<Integer>();
		HashMap<Integer, String> pms = new HashMap<Integer, String>();
		String memberToken = "";
		
		try {
			members = MemberDAO.getSameCategoryMembers(inputMemberCategory); // 넘겨받은 카테고리에 해당하는 회원들 구하기
			
			for(int i=0; i<members.size(); i++) {
				memberToken = MemberTokenDAO.getMemberToken(members.get(i)); // 회원에 해당하는 토큰 가져오기
				
				if(!memberToken.equals("")) { // 디바이스가 등록된 회원인 경우 푸시 발송할 대상에 포함
					pms.put(members.get(i), memberToken);
				}
			}

			Set<Integer> keys = pms.keySet(); // key 문자열을 가진 집항 Set 컬렉션 리턴
			Iterator<Integer> iter = keys.iterator(); // key 문자열을 순서대로 접근할 수 있는 Iterator 리턴
			
			while(iter.hasNext()) {
				int inputMemberNo = iter.next();
				String inputMemberTokenKey = pms.get(inputMemberNo);
				
				String cmd[] = {"/usr/bin/node", "/home/dksw/sh/gcm-provider.js", inputMemberTokenKey, inputMessage};
				ShellUtil.execCommand(cmd);
				
				AdminDAO.addPushLog((System.currentTimeMillis())/1000, inputMessage, inputMemberNo);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		}
	}
	
	// 회원 번호를 리스트로 받아 푸시 보내기
	public static void sendAndroidPushByArray(ArrayList<Integer> members, String inputLink, String inputMessage) throws SQLException {

		HashMap<Integer, String> pms = new HashMap<Integer, String>();
		String memberToken = "";
		
		try {
			for(int i=0; i<members.size(); i++) {
				memberToken = MemberTokenDAO.getMemberToken(members.get(i)); // 회원에 해당하는 토큰 가져오기
				
				if(!memberToken.equals("")) { // 디바이스가 등록된 회원인 경우 푸시 발송할 대상에 포함
					pms.put(members.get(i), memberToken);
				}
			}

			Set<Integer> keys = pms.keySet(); // key 문자열을 가진 집항 Set 컬렉션 리턴
			Iterator<Integer> iter = keys.iterator(); // key 문자열을 순서대로 접근할 수 있는 Iterator 리턴
			
			while(iter.hasNext()) {
				int inputMemberNo = iter.next();
				String inputMemberTokenKey = pms.get(inputMemberNo);
				
				String cmd[] = {"/usr/bin/node", "/home/dksw/sh/gcm-provider.js", inputMemberTokenKey, inputMessage};
				ShellUtil.execCommand(cmd);
				
				AdminDAO.addPushLog((System.currentTimeMillis())/1000, inputMessage, inputMemberNo);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		}
	}	
}
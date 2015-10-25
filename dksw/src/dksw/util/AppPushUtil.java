package dksw.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import dksw.model.MemberTokenDAO;
import dksw.model.MemberDAO;

public class AppPushUtil {

	public static void sendAndroidPush(int inputMemberCategory, String inputLink, String inputMessage) throws SQLException {

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

			Set<Integer> set = pms.keySet();
			Iterator<Integer> iter = set.iterator();
			
			for(int i=0; i<pms.size(); i++) {
				String cmd[] = {"/usr/bin/node", "/home/dksw/sh/gcm-provider.js", pms.get(iter.next()), inputMessage};
				ShellUtil.execCommand(cmd);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		}
	}
}
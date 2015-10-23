package dksw.util;

public class PermissionCheck {
	
	public static boolean checkPermission(String permission, String memberCategory) {

		CommonUtil.userSpilt(permission);
		
		for(int i=0; i<CommonUtil.userSpilt(permission).size(); i++) {
			if(CommonUtil.userSpilt(permission).get(i).equals(memberCategory)) { // 허용된 카테고리 탐색
				return true;
			}
		}
		
		return false;
	}
}

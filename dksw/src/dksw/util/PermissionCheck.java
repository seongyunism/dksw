package dksw.util;

public class PermissionCheck {
	
	public static boolean checkPermission(String permission, String memberCategory) {

		CommonUtil.commonSpilt(permission);
		
		for(int i=0; i<CommonUtil.commonSpilt(permission).size(); i++) {
			if(CommonUtil.commonSpilt(permission).get(i).equals(memberCategory)) { // 허용된 카테고리 탐색
				return true;
			}
		}
		
		return false;
	}
}

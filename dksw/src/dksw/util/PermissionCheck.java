package dksw.util;

public class PermissionCheck {
	
	public static boolean checkPermission(String permission, String memberCategory) {
		
		String[] temp = null;

		temp = permission.split(";");
		
		for(int i=0; i<temp.length; i++) {
			if(temp[i].equals(memberCategory)) { // 허용된 카테고리 탐색
				return true;
			}
		}
		
		return false;
	}
}

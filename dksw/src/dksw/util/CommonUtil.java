package dksw.util;

import java.util.ArrayList;
import java.util.List;

public class CommonUtil {

	public static List<String> userSpilt(String str) {
		
		List<String> list = new ArrayList<String>();
		String[] temp = null;

		temp = str.split(";");
		
		for(int i=0; i<temp.length; i++) {
			list.add(temp[i]);
		}
		
		return list;
	}
	
	public static String uploadPathInitialize(String category) {
		
		switch(category) {
			case "board_department":
				return "sub_01/board";
			case "board_student":
				return "sub_01/board";
			case "board_job":
				return "sub_01/board";
			case "board_free":
				return "sub_05/board";
			default:
				return "FAIL";
		}
	}
}

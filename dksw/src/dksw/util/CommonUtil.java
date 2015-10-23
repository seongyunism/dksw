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
}

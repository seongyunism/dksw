package dksw.util;

import java.io.IOException;

public class ShellUtil {

	public static boolean execCommand(String cmd[]) {
		
		Process proc = null;
		
		try {
			proc = Runtime.getRuntime().exec(cmd);
			proc.waitFor();
			
			if(proc.exitValue() != 0) {
				System.out.println("exit value was non-zero");
				return false;
			} else {
				System.out.println("실행완료");
				return true;
			}

		} catch(IOException e) {
			e.printStackTrace();
		} catch(InterruptedException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
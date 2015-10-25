package dksw.util;

import java.io.IOException;

public class ShellUtil {

	public static void execCommand(String cmd[]) {
		
		Process proc = null;
		
		try {
			proc = Runtime.getRuntime().exec(cmd);
			proc.waitFor();
			
			if(proc.exitValue() != 0) {
				System.out.println("exit value was non-zero");
			}
			System.out.println("실행완료");
			
		} catch(IOException e) {
			e.printStackTrace();
		} catch(InterruptedException e) {
			e.printStackTrace();
		}
		
	}
	
	
}

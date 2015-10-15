package dksw.mobile.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import dksw.mobile.controller.MemberController;

public class MainActivity extends Activity {

	EditText etMemberEmail, etMemberPassword;
	Button btnLogin;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		
		// 인터넷 직접 접속을 위한 정책 추가
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
		
        // 레이아웃 요소 초기화
        etMemberEmail = (EditText)findViewById(R.id.etMemberEmail);
        etMemberPassword = (EditText)findViewById(R.id.etMemberPassword);
		btnLogin = (Button)findViewById(R.id.btnLogin);	
		
		// 로그인 버튼 마우스 클릭 리스너 지정
		btnLogin.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {

				// 로그인 여부 확인
				boolean checkMemberLogin = false;

				// EditText에 입력값을 String 변수에 저장
				String inputMemberEmail = etMemberEmail.getText().toString();
				String inputMemberPassword = etMemberPassword.getText().toString();
				TextView outputTextLoginStatus = (TextView)findViewById(R.id.LoginStatus);
				
				// 로그인 체크를 위해 계정 정보 loginCheck() 메서드로 전달
				checkMemberLogin = MemberController.loginCheck(inputMemberEmail, inputMemberPassword);
				
		 	    if(checkMemberLogin) {
		 	    	System.out.println("로그인 성공");

		 	    	Intent intent = new Intent(MainActivity.this, DashiboardActivity.class);
					startActivity(intent);
					overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
					
					finish();
				
				// 로그인 실패 시 텍스트뷰에 메시지 출력
		 	    } else {
		 	    	System.out.println("로그인 실패");
		 	    	outputTextLoginStatus.setText("잘못 입력하였습니다.");	 	    	
		 	    }

			}
		});
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}

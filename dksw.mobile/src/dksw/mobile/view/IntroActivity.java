package dksw.mobile.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

public class IntroActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.intro);
		
		Handler handler = new Handler();
		handler.postDelayed(new Runnable() {

			public void run() {
				Intent intent = new Intent(IntroActivity.this, MainActivity.class);
				startActivity(intent);
				overridePendingTransition(R.anim.fade, R.anim.hold);
				
				finish();
			}
		}, 3000); // 3초후에 자동으로 메인액티비티(로그인액티비티)로 이동
	}
				
}

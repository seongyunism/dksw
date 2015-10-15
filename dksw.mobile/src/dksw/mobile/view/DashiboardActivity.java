package dksw.mobile.view;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class DashiboardActivity extends Activity {

	TextView status;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.dashiboard);
	
		status = (TextView)findViewById(R.id.status);
	}
}
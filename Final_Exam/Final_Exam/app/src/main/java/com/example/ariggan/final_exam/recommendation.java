package com.example.ariggan.final_exam;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.w3c.dom.Text;

public class recommendation extends AppCompatActivity {
    String name;
    String URL;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recommendation);

        Intent intent = getIntent();
        name=intent.getStringExtra("recommendationName");
        URL=intent.getStringExtra("recommendationWeb");

        TextView title = (TextView) findViewById(R.id.recNameText);
        title.setText(name);

        Button infoButton = (Button) findViewById(R.id.learnButton);

        View.OnClickListener onward = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openPage();
            }
        };
        infoButton.setOnClickListener(onward);
    }
    void openPage(){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(URL));
        startActivity(intent);
    }

}

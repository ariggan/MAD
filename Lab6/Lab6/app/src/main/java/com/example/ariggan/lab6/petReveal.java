package com.example.ariggan.lab6;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;

public class petReveal extends AppCompatActivity {

    private String petType;
    private String petURL;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pet_reveal);

        Intent intent = getIntent();
        petType = intent.getStringExtra("animalType");
        petURL = intent.getStringExtra("animalURL");

        ImageView mainImg = (ImageView) findViewById(R.id.petImage);
        TextView mainTxt = (TextView) findViewById(R.id.petText);
        Button mainButton = (Button) findViewById(R.id.urlButton);

        switch(petType) {
            case "Dog":
                mainImg.setImageResource(R.drawable.cutefatdog);
                mainTxt.setText("Your ideal pet is a dog!");
                break;
            case "Cat":
                mainImg.setImageResource(R.drawable.cutefatkitten);
                mainTxt.setText("Your ideal pet is a cat!");
                break;
            case "Fish":
                mainImg.setImageResource(R.drawable.cutefatfish);
                mainTxt.setText("Your ideal pet is a fish!");
                break;

            case "Hamster":
                mainImg.setImageResource(R.drawable.cutefathamster);
                mainTxt.setText("Your ideal pet is a hamster!");
                break;

            default:
                mainButton.setText("Look at other pets you may like.");
                break;

        }


        View.OnClickListener onclick=new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view);
            }
        };

        mainButton.setOnClickListener(onclick);
    }

    public void loadWebSite(View view){
        Log.d("msg","made it");
        Intent newIntent = new Intent(Intent.ACTION_VIEW);
        newIntent.setData(Uri.parse(petURL));
        startActivity(newIntent);
    }
}

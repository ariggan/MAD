package com.example.ariggan.final_exam;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

import org.w3c.dom.Text;

public class MainActivity extends AppCompatActivity {

    restaurant myPlace = new restaurant();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button buildBurrito = (Button) findViewById(R.id.buildButton);
        Button findBurrito = (Button) findViewById(R.id.findButton);
        View.OnClickListener onclick = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                assembleBurrito();
            }
        };
        buildBurrito.setOnClickListener(onclick);

        View.OnClickListener onfind = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                findBurrito();
            }
        };
        findBurrito.setOnClickListener(onfind);
    }
    public class restaurant{
        private String recommendation;
        private String web;
        public restaurant(){

        }
        public restaurant(String rec, String website){
            recommendation=rec;
            web = website;
        }
        public String getRecommendation(){
            return recommendation;
        }
        public void setRecommendation(String rec){
            recommendation = rec;
        }
        public String getWeb(){
            return web;
        }
        public void setWeb(String website){
            web=website;
        }

    }
    void newPage(){
        Intent intent = new Intent(this,recommendation.class);
        intent.putExtra("recommendationName", myPlace.getRecommendation());
        intent.putExtra("recommendationWeb", myPlace.getWeb());
        startActivity(intent);
    }
    void findBurrito(){
        String rec = "";
        String website="";
        Spinner location = (Spinner)findViewById(R.id.places);
        String chosenPlace = String.valueOf(location.getSelectedItem());
        switch (chosenPlace) {
            case ("The Hill"):
                rec = "Illegal Pete's";
                website = "http://illegalpetes.com/";
                break;
            case ("29th Street"):
                rec = "Chipotle";
                website = "https://www.chipotle.com/";
                break;
            case ("Pearl Street"):
                rec = "Bartaco";
                website = "https://bartaco.com/";
                break;
            default:
                rec = "error";
                break;
        }
        myPlace.setRecommendation(rec);
        myPlace.setWeb(website);
        newPage();
    }
    void assembleBurrito(){
        TextView resultText=(TextView) findViewById(R.id.resultText);
        String meatOrVeg = "meat or veggies";
        String tacoOrBurrito = "thing";
        String foodPlace = "anywhere";
        String sides="";


        //get toggleButton information
        ToggleButton meatVeg = (ToggleButton) findViewById(R.id.meatVeg);
        if (meatVeg.isChecked()){
            meatOrVeg="veggies";
        }
        else{
            meatOrVeg="meat";
        }

        //get Spinner information

        Spinner location = (Spinner)findViewById(R.id.places);
        String chosenPlace = String.valueOf(location.getSelectedItem());
        foodPlace = chosenPlace;

        //get RadioButton information:
        RadioGroup foodType = (RadioGroup) findViewById(R.id.foodType);
        int type = foodType.getCheckedRadioButtonId();

        if(type == R.id.taco){
            tacoOrBurrito = "taco";
        }
        else if(type==R.id.burrito){
            tacoOrBurrito = "burrito";
        }


        //Checkbox information
        CheckBox cheese = (CheckBox)findViewById(R.id.cheeseBox);
        CheckBox salsa = (CheckBox)findViewById(R.id.salsaBox);
        CheckBox sCream = (CheckBox)findViewById(R.id.sCreamBox);
        CheckBox guac = (CheckBox)findViewById(R.id.guacBox);
        if(cheese.isChecked()){
            sides+= " and with cheese ";
        }
        if(salsa.isChecked()){
            sides+=" and with salsa ";
        }
        if (sCream.isChecked()){
            sides+=" and with sour cream ";
        }
        if(guac.isChecked()){
            sides+=" and with guacamole ";
        }

        resultText.setText("You should order a "+tacoOrBurrito+" with "+meatOrVeg+sides+" at "+foodPlace);
    }
}



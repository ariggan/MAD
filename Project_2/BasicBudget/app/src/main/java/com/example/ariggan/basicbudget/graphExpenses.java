package com.example.ariggan.basicbudget;

import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

public class graphExpenses extends AppCompatActivity {
    double housingCost;
    double groceryCost;
    double miscCost;
    double socialCost;
    double carCost;
    double workIncome;
    double miscIncome;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_graph_expenses);

        Intent intent = getIntent();
        housingCost = intent.getDoubleExtra("housingCost",housingCost);
        carCost = intent.getDoubleExtra("carCost",carCost);
        groceryCost = intent.getDoubleExtra("groceryCost",groceryCost);
        socialCost = intent.getDoubleExtra("socialCost",socialCost);
        miscCost = intent.getDoubleExtra("miscCost",miscCost);

        createGraph();
    }

    private void createGraph(){
        double max = housingCost+carCost+groceryCost+socialCost+miscCost;

        double percentHousing = (housingCost/max);
        double percentCar = (carCost/max);
        double percentGrocery = (groceryCost/max);
        double percentSocial = (socialCost/max);
        double percentMisc = (miscCost/max);

        SurfaceView graphSpace = (SurfaceView) findViewById(R.id.graphSpace);
        Log.d("Error checking", "1");
        SurfaceHolder myHolder = graphSpace.getHolder();
        Log.d("Error checking", "2");
        Canvas drawSpace = myHolder.lockCanvas();
        Log.d("Error checking", "3");
        //graphSpace.draw(drawSpace);
        Log.d("Error checking", "4");
        Paint barColor = new Paint();
        barColor.setColor(getResources().getColor(R.color.green));
        //drawSpace is apparently Null
        drawSpace.drawRect(100,100,1,1,barColor);
        myHolder.unlockCanvasAndPost(drawSpace);
    }
}

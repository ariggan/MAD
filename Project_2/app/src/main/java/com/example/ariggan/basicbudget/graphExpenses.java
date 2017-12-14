package com.example.ariggan.basicbudget;

import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import com.jjoe64.graphview.DefaultLabelFormatter;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.ValueDependentColor;
import com.jjoe64.graphview.helper.StaticLabelsFormatter;
import com.jjoe64.graphview.series.BarGraphSeries;
import com.jjoe64.graphview.series.DataPoint;

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


        //For graphing elements and how to use them I used this site http://www.android-graphview.org/simple-graph/
        GraphView graph = (GraphView) findViewById(R.id.graph);
        BarGraphSeries<DataPoint> series = new BarGraphSeries<>(new DataPoint[] {
                new DataPoint(0,0),
                new DataPoint(5, housingCost),
                new DataPoint(10, carCost),
                new DataPoint(15, socialCost),
                new DataPoint(20, groceryCost),
                new DataPoint(25, miscCost),
                new DataPoint(30,0)
        });
        graph.addSeries(series);

// styling
        StaticLabelsFormatter staticLabelsFormatter = new StaticLabelsFormatter(graph);
        staticLabelsFormatter.setHorizontalLabels(new String[] {"","Housing", "Car", "Social", "Grocery","Misc.",""});
        graph.getGridLabelRenderer().setLabelFormatter(staticLabelsFormatter);

        series.setValueDependentColor(new ValueDependentColor<DataPoint>() {
            @Override
            public int get(DataPoint data) {
                return Color.rgb((int) data.getY()*255/4, (int) Math.abs(data.getY()*255/4), 50);
            }
        });


        series.setSpacing(40);

// draw values on top
        series.setDrawValuesOnTop(true);
        series.setValuesOnTopColor(Color.RED);
//series.setValuesOnTopSize(50);
    }
}

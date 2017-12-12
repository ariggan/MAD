package com.example.ariggan.basicbudget;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class MainActivity extends AppCompatActivity {

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
        setContentView(R.layout.activity_main);

        Button getResult = (Button) findViewById(R.id.calcButton);
        View.OnClickListener onclick = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                collectAmounts();
                printBalance();
            }
        };

        Button graphButton = (Button) findViewById(R.id.graphButton);
        View.OnClickListener graphclick = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openGraphPage();
            }
        };
        getResult.setOnClickListener(onclick);
        graphButton.setOnClickListener(graphclick);


    }
    private Double formatEntry(Double input){
        //Reference for NumberFormat code below: https://stackoverflow.com/questions/12806278/double-decimal-formatting-in-java
        //Ensure that whatever users enter is rounded to 2 decimal places aka money format
        NumberFormat formatter = new DecimalFormat("#0.00");
        Log.d("what is input", "It is: " + input);
        String stringInput;
        stringInput = formatter.format(input);

        //Converts the String returned from the input line into a double for calculations
        Double output = Double.parseDouble(stringInput);
        return output;
    }
    private void printBalance(){
        double income = workIncome+miscIncome;
        double expense = housingCost+carCost+groceryCost+socialCost+miscCost;
        double balance = income-expense;

        //reformat balance to fit a classic money format
        balance = formatEntry(balance);

        TextView resultText = (TextView) findViewById(R.id.resultText);

        String stringBalance = Double.toString(balance);
        resultText.setText("$"+stringBalance);

        if (balance<=0){
            resultText.setTextColor(getResources().getColor(R.color.red));
        }
        else{
            resultText.setTextColor(getResources().getColor(R.color.green));
        }
    }

    private void collectAmounts(){
        //Pulls information out of the edit text fields
        String temp;
        workIncome = 0;
        miscIncome = 0;
        housingCost = 0;
        carCost = 0;
        groceryCost = 0;
        socialCost = 0;
        miscCost = 0;

        //Income Fields

        //work income(s)
        EditText workMon = (EditText) findViewById(R.id.workIncomeEntry);
        temp = workMon.getText().toString();
        if (!temp.isEmpty()) {
            workIncome = formatEntry(Double.parseDouble(temp));
        }

        //Miscellaneous income such as gifts or prizes
        EditText miscInc = (EditText) findViewById(R.id.miscIncomeEntry);
        temp = miscInc.getText().toString();
        if (!temp.isEmpty()) {
            miscIncome = formatEntry(Double.parseDouble(temp));
        }
        //Expense Fields

        //Housing Expenses
        EditText housingExpense = (EditText) findViewById(R.id.housingExpenseEntry);
        temp = housingExpense.getText().toString();
        if (!temp.isEmpty()) {
            housingCost = formatEntry(Double.parseDouble(temp));
        }
        //Vehicle Expenses
        EditText carExpense = (EditText) findViewById(R.id.carExpenseEntry);
        temp = carExpense.getText().toString();
        if (!temp.isEmpty()) {
            carCost = formatEntry(Double.parseDouble(temp));
        }
        //Grocery Expenses
        EditText groceryExpense = (EditText) findViewById(R.id.groceryExpenseEntry);
        temp = groceryExpense.getText().toString();
        if (!temp.isEmpty()) {
            groceryCost = formatEntry(Double.parseDouble(temp));
        }

        //Expenses from social events and going out
        EditText socialExpense = (EditText) findViewById(R.id.socialExpenseEntry);
        temp = socialExpense.getText().toString();
        if (!temp.isEmpty()) {
            socialCost = formatEntry(Double.parseDouble(temp));
        }

        //Miscellaneous expenses that don't quite fit in the other categories
        EditText miscExpense = (EditText) findViewById(R.id.miscExpenseEntry);
        temp = miscExpense.getText().toString();
        if (!temp.isEmpty()) {
            miscCost = formatEntry(Double.parseDouble(temp));
        }

        Log.d("testHousingCost", "housingCostIs: "+housingCost);
    }
    private void openGraphPage(){
        collectAmounts();

        Intent intent = new Intent(this, graphExpenses.class);
        intent.putExtra("housingCost",housingCost);
        intent.putExtra("carCost", carCost);
        intent.putExtra("groceryCost", groceryCost);
        intent.putExtra("socialCost", socialCost);
        intent.putExtra("miscCost",miscCost);

        startActivity(intent);
    }
}


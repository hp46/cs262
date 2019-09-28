package edu.calvin.cs262.hp46;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener {

    public String operator;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Spinner myspinner = findViewById(R.id.spinner);
        if (myspinner != null){
            myspinner.setOnItemSelectedListener(this);
        }

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        if(myspinner != null){
            myspinner.setAdapter(adapter);
        }

    }
    //calucuate input
    public void calculate(View view) {
        
        //variables
        EditText input_1 = findViewById(R.id.input1);
        EditText input_2 = findViewById(R.id.input2);

        String input_1_string = input_1.getText().toString();
        String input_2_string = input_2.getText().toString();

        int result = 0;
        int input_1_int = Integer.parseInt(input_1_string);
        int input_2_int = Integer.parseInt(input_2_string);

        if (operator.equals("+")){
            result = input_1_int + input_2_int;
        } else if (operator.equals("-")){
            result = input_1_int - input_2_int;
        } else  if (operator.equals("/")){
            result = input_1_int / input_2_int;
        } else  if (operator.equals("*")){
            result = input_1_int * input_2_int;
        }

        //result
        TextView textView = findViewById(R.id.result);
        String result_string = Integer.toString(result);
        textView.setText(result_string);

    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
        operator = adapterView.getItemAtPosition(i).toString();

    }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {

    }
}
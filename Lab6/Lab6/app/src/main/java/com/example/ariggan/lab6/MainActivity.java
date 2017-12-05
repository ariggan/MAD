package com.example.ariggan.lab6;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.RadioGroup;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button button = (Button) findViewById(R.id.petMatchButton);
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                transfer2Page(view);
            }
        };
        button.setOnClickListener(onclick);
    }
    public class animalPick{
        private String animalType;
        private String LearnMore;
        public void setAnimalChoice() {
            RadioGroup animal = (RadioGroup) findViewById(R.id.animalType);
            int animalChoice = animal.getCheckedRadioButtonId();
            if (animalChoice==-1){
                Context context = getApplicationContext();
                CharSequence msg = "If you want a more precise animal choice, please select one of the criteria above.";
                int duration = Toast.LENGTH_SHORT;
                Toast myToast = Toast.makeText(context, msg, duration);
                myToast.show();
                animalType = "Empty";
                LearnMore = "https://www.boulderhumane.org";
            }
            else
            {

                if(animalChoice==R.id.dog) {
                    animalType = "Dog";
                    LearnMore = "http://www.petmd.com/dog/care/evr_dg_before_getting_a_dog";
                }
                else if (animalChoice==R.id.cat) {
                        //cat
                        animalType = "Cat";
                        LearnMore = "https://www.buzzfeed.com/kaelintully/freddie-mercury-was-an-expert-on-these-facts?utm_term=.eh4y3WQZ3O#.vpr9PbYzPR";
                }
                else if (animalChoice==R.id.fish) {
                    //fish
                    animalType = "Fish";
                    LearnMore = "https://www.petplace.com/article/fish/general/what-you-need-to-know-before-buying-fish/";
                }
                else if (animalChoice==R.id.hamster) {
                    //hamster
                    animalType = "Hamster";
                    LearnMore = "https://www.wikihow.com/Care-for-a-Hamster";
                }
                else{
                        //nothing

                }
            }
        }
        public String getAnimalType(){
            return animalType;
        }
        public String getLearnMore(){
            return LearnMore;
        }

    }
    private animalPick myAnimal=new animalPick();

    public void transfer2Page(View view){
        myAnimal.setAnimalChoice();
        String myPet = myAnimal.getAnimalType();
        String myLearnMore=myAnimal.getLearnMore();

        Log.d("myPet",myPet);
        Log.d("myURL",myLearnMore);

        Intent intent=new Intent(this, petReveal.class);
        intent.putExtra("animalType",myPet);
        intent.putExtra("animalURL",myLearnMore);

        startActivity(intent);
    }
}

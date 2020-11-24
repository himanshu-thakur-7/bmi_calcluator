import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'Reusable_card.dart';
import 'input_page.dart';



class ResultsPage extends StatelessWidget {


  String bmi=calcBrain.CalculateBMI();
  String verdict=calcBrain.getResult();
  String comment=calcBrain.getinterpretation();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),

      ),
      body: Column(
        children: <Widget>[
          Text(
            'Your Result',
            style: Kstyle2,

          ),
          Expanded(
            child: ReusableCard(
         colour: Color(KactiveCardColour),
              cardChild:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Text(
                        verdict,

                        style: TextStyle(
                          fontSize: 25,
                              fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),

                      ),
                    ),

                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        bmi,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 85,

                        )
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 30.0),
                      child: Text(
                        comment,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,

                        ),

                      ),
                    ),

                  ),


                ],

              ),

            ),
          ),
          GestureDetector(
            onTap: (){

              Navigator.pop(context, MaterialPageRoute(builder: (context){
                return InputPage();
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: Kstyle3,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: Kbottomheight,
            ),
          )

        ],

      ),

    );
  }
}

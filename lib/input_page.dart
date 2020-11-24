import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_content.dart';
import 'Reusable_card.dart';
import 'Constants.dart';
import 'Results_page.dart';
import 'CalcBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
enum Gender{Male,Female}
int height=180;
int weight=60;
CalcBrain calcBrain;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {

//  int maleCardColor = inactiveCardColour;
//  int femaleCardColor = inactiveCardColour;
Gender selectedGender=null;

int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget> [
                Expanded(
                  child: ReusableCard(
                   colour: selectedGender==Gender.Male ? Color(KactiveCardColour) : Color(KinactiveCardColour),
                   cardChild: Content(
                     text: 'MALE',
                     i: FontAwesomeIcons.mars,
                   )
                   ,
                    Ges: (){
                     setState(() {
                       selectedGender=Gender.Male;
                     });
                    },
                    ),
                ),
                Expanded(
                  child:ReusableCard(
                    colour: selectedGender==Gender.Female ? Color(KactiveCardColour) : Color(KinactiveCardColour),
                    cardChild: Content(
                      text: 'FEMALE',
                      i: FontAwesomeIcons.venus,
                    ),
                    Ges: (){
                      setState(() {
                        selectedGender=Gender.Female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child:ReusableCard(
              colour: Color(KactiveCardColour),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: Ktstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,

                    children: <Widget>[
                      Text(
                        height.toString(),
                        style:Kstyle2,
                      ),
                      Text(
                        'cm',
                        style: Ktstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0)


                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,


                      onChanged: (double newval){
                        setState(() {
                          height=newval.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(KactiveCardColour),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: Ktstyle,

                        ),
                        Text(
                          weight.toString(),
                          style: Kstyle2,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                            btn: FontAwesomeIcons.minus,
                             pressed: weight>0? (){
                              setState(() {
                                weight--;
                              });
                             }:
                             (){
                              setState(() {
                                weight=0;
                              });
                             }
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(

                              btn: FontAwesomeIcons.plus,
                              pressed: (){
                                setState(() {
                                  weight++;
                                });

                              },
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(KactiveCardColour),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: Ktstyle,

                      ),
                      Text(
                        age.toString(),
                        style: Kstyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                           btn: FontAwesomeIcons.minus,
                            pressed: age>0? (){
                            setState(() {
                            age--;
                            });
                            }:
                                (){
                          setState(() {
                          age=0;
                          });
                          }
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            btn: FontAwesomeIcons.plus,
                            pressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  ),

                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){


              if(selectedGender==null)
                {
                  print('clicked with null');
                  Alert(
                    context: context,
                      title: "PLEASE SELECT GENDER!!",
                    style: alertStyle
                  ).show();
                }
              else{
                    print('height: $height');
                    print('Weight: $weight');
                    calcBrain=CalcBrain(h: height,w: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultsPage();

              }));
              }
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
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

class RoundIconButton extends StatelessWidget {
  final IconData btn;
  final Function pressed;
  RoundIconButton({this.btn,this.pressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(btn),
     elevation: 6.0,
      onPressed: pressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
     constraints: BoxConstraints.tightFor(
      width: 56.0,
      height: 56.0,
    )

    );
  }
}
const Kstyle3=TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold
);
var alertStyle = AlertStyle(
animationType: AnimationType.fromTop,
alertBorder: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10.0),

),
titleStyle: TextStyle(
color: Colors.white,
fontSize: 28.0,
fontWeight: FontWeight.bold
),

);


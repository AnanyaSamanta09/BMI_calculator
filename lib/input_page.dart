import 'package:bmicalculator/Bottom_Button.dart';
import 'package:bmicalculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:bmicalculator/icon_content.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/RoundIconButton.dart';
import 'package:bmicalculator/Computer_brain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Text('BMI CALCULATOR'), //use ctrl+B for looking behind text thing
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
                  //for 1st row....2 column boxes
                  children: [
                    Expanded(
                      //for 1st row.....1st column box
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.Male;
                          });
                        },
                        colour: selectedGender == Gender.Male
                            ? kactiveCardColour
                            : kinactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.male,
                          label: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        //for 1st row....2nd column box
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.Female;
                          });
                        },
                        colour: selectedGender == Gender.Female
                            ? kactiveCardColour
                            : kinactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.female,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: ReusableCard(
                //for middle row
                colour: kactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //This will bring down everything to the middle of the column
                  children: [
                    Text('HEIGHT', style: klabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //it will bring 180cm to the center(it's along the length of the row)
                      crossAxisAlignment: CrossAxisAlignment
                          .baseline, //crossAxisAlignment is for column
                      textBaseline: TextBaseline
                          .alphabetic, //if we don't write this it will show error
                      children: [
                        Text(
                          height
                              .toString(), //('180')height.to string because text need to be in string
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white, //to make slider white
                        thumbColor: Color(
                            0xFFEB1555), //to make ball shaped to pink color
                        overlayColor: Color(
                            0x29EB1555), //to make tbhe shadoen over ball shaped to pink
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius:
                            15.0), //to make the ball shaped on slider big
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius:
                            30.0), //it's for the shadow(animation) on the ball shaped when it is clicked
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            //it is used to move the slider
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
                  //for last row
                  children: [
                    Expanded(
                      child: ReusableCard(
                        //for last row....1st column
                        colour: kactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: klabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              // row that contain two button
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--; //this is done to decrease the weight by clicking the minus sign
                                      });
                                    }),
                                SizedBox(
                                  //for the space between two buttons
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++; //this is done to increase the weight by clicking the plus sign
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
                        //for last row....2nd column
                        colour: kactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: klabelTextStyle,
                            ),
                            Text(
                              age.toString(), //to convert age to string
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--; //this is done to decrease the weight by clicking the minus sign
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++; //this is done to increase the weight by clicking the plus sign
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  //to return to the next page
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';


class BottomButton extends StatelessWidget {

  //custom constructor
  BottomButton({@required this.onTap, @required this.buttonTitle});  //required because it's a button which probably needs a text & a ontap
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(   //it is used for last calculate box
      onTap: onTap,
      child: Container(         //this is for down red colour row
        child: Center(
            child: Text(buttonTitle,
              style: kLargeButtonTextStyle,
            )
        ),
        color: kbottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom:20.0),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}

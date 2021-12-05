import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class IconContent extends StatelessWidget {

  IconContent({this.icon,this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,  //to make pic & text in center
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(   //to provide gap between image & text
          height: 15.0,
        ),
        Text(
            label,
            style: klabelTextStyle
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app3/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String iconText;

  IconContent({this.icon, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          iconText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

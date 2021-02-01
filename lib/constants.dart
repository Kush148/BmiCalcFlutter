import 'package:flutter/material.dart';
import 'package:flutter_app3/components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/resuable_card.dart';

const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEE1555);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kButtonStyle = TextStyle(
  fontSize: 20,
  color: Colors.pinkAccent,
);

enum gender { male, female }

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResuableCard(
                      color: selectedGender == gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: IconContent(
                        icon: FontAwesomeIcons.mars,
                        iconText: 'MALE',
                      ),
                      onClicked: () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      color: selectedGender == gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: IconContent(
                        icon: FontAwesomeIcons.venus,
                        iconText: 'FEMALE',
                      ),
                      onClicked: () {
                        setState(() {
                          selectedGender = gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ResuableCard(
                color: kActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResuableCard(
                      color: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      color: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'CALCULATE',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

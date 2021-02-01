import 'package:flutter/material.dart';
import 'package:flutter_app3/constants.dart';
import 'package:flutter_app3/screens/ResultPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum gender { male, female }

class _InputPageState extends State<InputPage> {
  int height = 150;
  int weight = 60;
  int age = 20;
  gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  onTouch: () {
                    setState(() {
                      selectedGender = gender.male;
                    });
                  },
                  colors: selectedGender == gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: CardDetails(
                    icon: FontAwesomeIcons.mars,
                    gender: 'MALE',
                  ),
                ),
                ReusableCard(
                  onTouch: () {
                    setState(() {
                      selectedGender = gender.female;
                    });
                  },
                  colors: selectedGender == gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: CardDetails(
                    icon: FontAwesomeIcons.venus,
                    gender: 'FEMALE',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kInactiveCardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center, //not working??
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MeasurementContainer(
                    mName: 'HEIGHT',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      MeasurementContainer(
                        mName: 'CM',
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 300,
                    onChanged: (double selectedHeight) {
                      setState(() {
                        height = selectedHeight.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  colors: kInactiveCardColor,
                  child: Column(
                    children: [
                      MeasurementContainer(
                        mName: 'WEIGHT',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                          MeasurementContainer(
                            mName: 'KG',
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            circleContainer(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            circleContainer(
                              iconData: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ReusableCard(
                  colors: kInactiveCardColor,
                  child: Column(
                    children: [
                      MeasurementContainer(
                        mName: 'AGE',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                          MeasurementContainer(
                            mName: 'YRS',
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            circleContainer(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            circleContainer(
                              iconData: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ResultPage(
                                height: (height / 100).toDouble(),
                                weight: weight,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MeasurementContainer extends StatelessWidget {
  final String mName;

  MeasurementContainer({
    @required this.mName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Center(
          child: Text(
        mName,
        style: kLabelTextStyle,
      )),
    );
  }
}

class CardDetails extends StatelessWidget {
  final IconData icon;
  final String gender;

  CardDetails({this.icon, this.gender});

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
          height: 25,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colors;
  final Widget child;
  final Function onTouch;

  ReusableCard({@required this.colors, this.child, this.onTouch});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTouch,
        child: Container(
          margin: EdgeInsets.all(10),
          child: child,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colors,
          ),
        ),
      ),
    );
  }
}

class circleContainer extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;

  circleContainer({this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(iconData),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
    );
  }
}

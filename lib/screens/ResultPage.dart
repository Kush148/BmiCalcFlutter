import 'package:flutter/material.dart';
import 'package:flutter_app3/constants.dart';

//void main() => runApp(ResultPage());

class ResultPage extends StatefulWidget {
  double height;
  int weight;

  ResultPage({this.height, this.weight});

  // calculateBMI(height: this.height, weight: this.weight);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  ResultPage resultPage = new ResultPage();
  int weight;
  double height;
  String weightStatus;
  String weightQuote;
  Color color;

  @override
  void initState() {
    weight = widget.weight;
    height = widget.height;
    super.initState();
  }

  String calculateBMI({int weight, double height}) {
    double result = weight / (height * height);
    if (result < 18.5) {
      setStats(
          "UnderWeight",
          "You are Under weight. Time to increase your diet",
          Colors.yellowAccent);
    } else if (result == 18.5) {
      setStats(
          "Normal", "You have a normal body weight. Good job!!", Colors.green);
    } else if (result < 24.9) {
      setStats(
          "Normal", "You have a normal body weight. Good job!!", Colors.green);
    } else if (result == 25) {
      setStats("OverWeight", "You are Over weight. Time to limit your diet!!",
          Colors.orange);
    } else if (result < 29.9) {
      setStats("OverWeight", "You are Over weight. Time to limit your diet!!",
          Colors.orange);
    } else {
      setStats("Obesity", "Eat less and Exercise more !!", Colors.red);
    }
    return result.toStringAsFixed(2);
  }

  void setStats(weightStatus, weightQuote, color) {
    this.weightStatus = weightStatus;
    this.weightQuote = weightQuote;
    this.color = color;
  }

  // Underweight = <18.5
  // Normal weight = 18.5–24.9
  // Overweight = 25–29.9
  // Obesity = BMI of 30 or greater

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  child: Text(
                    'Your BMI :  ${calculateBMI(weight: weight, height: height)}',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: kInactiveCardColor,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          weightStatus,
                          style: TextStyle(fontSize: 25, color: color),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          calculateBMI(weight: weight, height: height)
                              .toString(),
                          style: TextStyle(fontSize: 40, color: color),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Expanded(
                        child: Center(
                          child: Text(
                            weightQuote,
                            style: TextStyle(fontSize: 25, color: color),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, //check
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

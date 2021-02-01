import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onClicked;

  ResuableCard({@required this.color, this.child, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}

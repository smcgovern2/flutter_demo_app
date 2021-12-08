import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class SwipeChecker extends StatefulWidget {
  const SwipeChecker({Key? key}) : super(key: key);

  @override
  _SwipeCheckerState createState() => _SwipeCheckerState();
  static const routeName = '/swipe_checker';
}

class _SwipeCheckerState extends State<SwipeChecker> {
  String _detectorText = "Swipe Left or Right";
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 2) {
                _setRight();
              }

              // Swiping in left direction.
              if (details.delta.dx < -2) {
                _setLeft();
              }
            },
            child: SizedBox.expand(
                child: Scaffold(
              appBar: AppBar(
                title: const Text('Swipe Detector'),
              ),
              body: Center(
                child:
                    Text(_detectorText, style: const TextStyle(fontSize: 25)),
              ),
            ))));
  }

  void _setLeft() {
    setState(() {
      _detectorText = "Left!";
    });
  }

  void _setRight() {
    setState(() {
      _detectorText = "Right!";
    });
  }
}

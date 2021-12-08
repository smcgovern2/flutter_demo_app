import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
  static const routeName = '/clock';
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    super.initState();
    _clockUpdater();
  }

  static DateTime now = DateTime.now();
  String _currentTime = '${now.hour}:${now.minute}:${now.second}';

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: SizedBox.expand(
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('Clock'),
                ),
                body: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: SizedBox.expand(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text(_currentTime,
                                style: const TextStyle(fontSize: 64)),
                          ]))),
                ))));
  }

  void _clockUpdater() async {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      now = DateTime.now();
      if (!mounted) {
        return;
      } else if (mounted) {
        setState(() {
          _currentTime = '${now.hour}:${now.minute}:${now.second}';
        });
      }
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class TallyCounter extends StatefulWidget {
  const TallyCounter({Key? key}) : super(key: key);

  @override
  _TallyCounterState createState() => _TallyCounterState();
  static const routeName = '/tally_counter';
}

class _TallyCounterState extends State<TallyCounter> {
  int _tallyCount = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: SizedBox.expand(
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('Tally Counter'),
                ),
                body: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: SizedBox.expand(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text('${_tallyCount}',
                                style: const TextStyle(fontSize: 64)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5, top: 45),
                                      height: 120,
                                      width: 120,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                        ),
                                        onPressed: () => {_tally()},
                                        child: const Text('^'),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5, top: 45),
                                      height: 120,
                                      width: 120,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.red),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                        ),
                                        onPressed: () => {_reset()},
                                        child: const Text('Reset'),
                                      ))
                                ])
                          ]))),
                ))));
  }

  void _reset() {
    setState(() {
      _tallyCount = 0;
    });
  }

  void _tally() {
    setState(() {
      _tallyCount++;
    });
  }
}

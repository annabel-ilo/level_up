import 'dart:ui';

import 'package:flutter/material.dart';

class TipSplit extends StatefulWidget {
  const TipSplit({Key? key}) : super(key: key);

  @override
  _TipSplitState createState() => _TipSplitState();
}

class _TipSplitState extends State<TipSplit> {
  int _tipPercent = 0;
  int _personCount = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Per Person',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '\$ ${calTotalPerPerson(_billAmount, _personCount, _tipPercent)}',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent[700]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.purple.shade50,
                    style: BorderStyle.solid,
                  )),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: Colors.grey[600],
                      ),
                      hintText: 'Total Bill',
                      // hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split',
                          style: TextStyle(
                            color: Colors.grey[900],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (_personCount > 1) {
                                    _personCount--;
                                  }
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.purple[50],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0),
                                  ),
                                ),
                              )),
                          Text(
                            '$_personCount',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.purpleAccent[700],
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _personCount++;
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.purple[50],
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0),
                                  ),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip',
                          style: TextStyle(
                            color: Colors.grey[900],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          '\$ ${(calTotalTip(_billAmount, _personCount, _tipPercent)).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.purpleAccent[700],
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$_tipPercent %',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: Colors.purpleAccent[700]),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.purpleAccent.shade700,
                          inactiveColor: Colors.grey.shade200,
                          divisions: 10,
                          value: _tipPercent.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercent = value.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calTotalPerPerson(double billAmount, int splitBY, int tipPercentage) {
    var totalPerPerson =
        (calTotalTip(billAmount, splitBY, tipPercentage) + billAmount) /
            splitBY;

    return totalPerPerson.toStringAsFixed(2);
  }

  calTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

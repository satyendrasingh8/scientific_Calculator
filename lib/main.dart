import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = '0';
  String expression = '';

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = '0';
        result = '0';
      } else if (buttonText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (buttonText == '=') {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'error';
        }
      } else {
        if (equation == '0') {
          equation = buttonText;
        }
        equation = equation + buttonText;
      }
    });
  }

  Widget buildButton(Color color, String text, double buttonHeight) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 1),
      child: FlatButton(
          padding: EdgeInsets.fromLTRB(11, 8, 11, 8),
          height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
          onPressed: () {
            buttonPressed(text);
          },
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(54),
              side: BorderSide(width: 1, color: Colors.black)),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
            ),
            textAlign: TextAlign.center,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Simple Calculator')),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
              child: Text(
                equation,
                style: TextStyle(fontSize: 38),
              ),
            ),
            Divider(),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
              child: Text(
                result,
                style: TextStyle(fontSize: 48),
              ),
            ),
            Expanded(
                child: Divider(
              height: 3,
              color: Colors.black45,
            )),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton(Colors.red, 'C', 1),
                        buildButton(Colors.blue, '⌫', 1),
                        buildButton(Colors.blue, '÷', 1),
                      ]),
                      TableRow(children: [
                        buildButton(Colors.grey, '9', 1),
                        buildButton(Colors.grey, '8', 1),
                        buildButton(Colors.grey, '7', 1),
                      ]),
                      TableRow(children: [
                        buildButton(Colors.grey, '6', 1),
                        buildButton(Colors.grey, '5', 1),
                        buildButton(Colors.grey, '4', 1),
                      ]),
                      TableRow(children: [
                        buildButton(Colors.grey, '3', 1),
                        buildButton(Colors.grey, '2', 1),
                        buildButton(Colors.grey, '1', 1),
                      ]),
                      TableRow(children: [
                        buildButton(Colors.grey, '.', 1),
                        buildButton(Colors.grey, '0', 1),
                        buildButton(Colors.grey, '00', 1),
                      ])
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Table(
                      children: [
                        TableRow(children: [
                          buildButton(Colors.blue, 'x', 1),
                        ]),
                        TableRow(children: [
                          buildButton(Colors.blue, '-', 1),
                        ]),
                        TableRow(children: [
                          buildButton(Colors.blue, '+', 1),
                        ]),
                        TableRow(children: [
                          buildButton(Colors.redAccent, '=', 2),
                        ]),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  String _expression = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            if (buttonText == "CLEAR") {
              _output = "0";
              _expression = "";
              num1 = 0.0;
              num2 = 0.0;
              operand = "";
            } else if (buttonText == "+" ||
                buttonText == "-" ||
                buttonText == "*" ||
                buttonText == "/") {
              num1 = double.parse(_expression);
              operand = buttonText;
              _expression = "";
            } else if (buttonText == ".") {
              if (!_expression.contains(".")) {
                _expression += buttonText;
              }
            } else if (buttonText == "=") {
              num2 = double.parse(_expression);
              if (operand == "+") {
                _output = (num1 + num2).toString();
              } else if (operand == "-") {
                _output = (num1 - num2).toString();
              } else if (operand == "*") {
                _output = (num1 * num2).toString();
              } else if (operand == "/") {
                _output = (num1 / num2).toString();
              }
              num1 = 0.0;
              num2 = 0.0;
              _expression = _output;
              operand = "";
            } else {
              _expression += buttonText;
            }
            output = _expression;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _result = "0";
  String _operation = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _result = "0";
      _operation = "";
      _num1 = 0.0;
      _num2 = 0.0;
    } else if (buttonText == "⌫") {
      _output = _output.substring(0, _output.length - 1);
      if (_output == "") {
        _output = "0";
      }
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
      _num1 = double.parse(_output);
      _operation = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);
      if (_operation == "+") {
        _result = (_num1 + _num2).toString();
      } else if (_operation == "-") {
        _result = (_num1 - _num2).toString();
      } else if (_operation == "×") {
        _result = (_num1 * _num2).toString();
      } else if (_operation == "÷") {
        _result = (_num1 / _num2).toString();
      }
      _output = _result;
      _operation = "";
    } else {
      _output += buttonText;
    }

    setState(() {
      _output = double.parse(_output).toString();
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(24.0),
        ),
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(children: [
            Row(children: [
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("÷"),
            ]),
            Row(children: [
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("×"),
            ]),
            Row(children: [
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-"),
            ]),
            Row(children: [
              _buildButton("."),
              _buildButton("0"),
              _buildButton("00"),
              _buildButton("+"),
            ]),
            Row(children: [
              _buildButton("C"),
              _buildButton("⌫"),
              _buildButton("="),
            ]),
          ])
        ],
      ),
    );
  }
}

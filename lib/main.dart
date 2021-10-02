import 'package:calculator/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  // debugPrintBeginFrameBanner = false;
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  //attributes
  String history = "";
  String expression = "";
  // methods
  void OnClick(String text) {
    setState(() {
      expression += text;
    });
  }

  void AllClear(String text) {
    setState(() {
      history = '';
      expression = '';
    });
  }

  void Clear(String text) {
    setState(() {
      expression = '';
    });
  }

  void Evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      history = expression;
      expression = eval.toString();
    });
  }

  void delLastNum(String str) {
    setState(() {
      if (expression != null && expression.length > 0) {
        expression = expression.substring(0, expression.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Calculator',
      home: Scaffold(
          backgroundColor: Color(0xFF283637),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                    color: Colors.grey[700],
                  ),
                ),
                alignment: Alignment(1, 1),
                padding: EdgeInsets.only(right: 15),
              ),
              Container(
                child: Text(
                  expression,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 40,
                    ),
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment(1, 1),
                padding: EdgeInsets.all(15),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: 'AC',
                    fillColor: Colors.lightBlue,
                    textColor: Colors.white,
                    callback: AllClear,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: Colors.lightBlue,
                    textColor: Colors.white,
                    callback: Clear,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: Colors.white,
                    textColor: Colors.black,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: Colors.white,
                    textColor: Colors.black,
                    callback: OnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '7',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '8',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '9',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '*',
                    fillColor: Colors.white,
                    textColor: Colors.black,
                    callback: OnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '4',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '5',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '6',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: Colors.white,
                    textColor: Colors.black,
                    callback: OnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '1',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '2',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '3',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: Colors.white,
                    textColor: Colors.black,
                    callback: OnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '.',
                    fillColor: Colors.blueGrey,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: '0',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: OnClick,
                  ),
                  CalcButton(
                    text: 'DEL',
                    fillColor: Colors.black,
                    textColor: Colors.white,
                    callback: delLastNum,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: Colors.white,
                    textColor: Colors.black,
                    callback: Evaluate,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

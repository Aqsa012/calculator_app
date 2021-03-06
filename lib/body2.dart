import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'history.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

int ue = 0, ur = 0, rr = 0, re = 0, inc = 0, inc2 = 0;
List<String> undoresult = [];
List<String> redoresult = [];
List<String> undoequation = [];
List<String> redoequation = [];

class _HomePageState extends State<HomePage2> with TickerProviderStateMixin {
  String equation = "0", result = "0"; // Expression and FinalResult
  List<String> cal = [];
  String ma = "";
  void historymain() {
    ma = equation + " = " + result;
    cal.add(ma);
  }

  Map<String, String> operatorsMap = {"÷": "/", "×": "*", "−": "-", "+": "+"};
  List buttonNames = [
    "7",
    "8",
    "9",
    "÷",
    "4",
    "5",
    "6",
    "×",
    "1",
    "2",
    "3",
    "−",
    "0",
    ".",
    "⌫",
    "+",
    "(",
    ")",
    "<<",
    ">>",
  ];

  void evaluateEquation() {
    try {
      // Fix equation
      Expression exp = (Parser()).parse(operatorsMap.entries.fold(
          equation, (prev, elem) => prev.replaceAll(elem.key, elem.value)));

      double res = double.parse(
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString());

      // Output correction for decimal results
      result = double.parse(res.toString()) == int.parse(res.toStringAsFixed(0))
          ? res.toStringAsFixed(0)
          : res.toStringAsFixed(4);
    } catch (e) {
      result = "Error";
    }
    cal.add(result);
    historymain();
    undoresult.add(result);

    undoequation.add(equation);
  }

  Widget _buttonPressed(String text, {bool isClear = false}) {
    setState(() {
      if (isClear) {
        // Reset calculator
        equation = result = "0";
      } else if (text == "⌫") {
        // Backspace
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") equation = result = "0"; // If all empty
      } else {
        // Default
        if (equation == "0" && text != ".") equation = "";
        equation += text;
      }

      // Only evaluate if correct expression
      if (!operatorsMap.containsKey(equation.substring(equation.length - 1)))
        evaluateEquation();
    });
  }

  // Grid of buttons
  Widget _buildButtons() {
    return Material(
      color: Color(0xFFF2F2F2),
      child: GridView.count(
          crossAxisCount: 4, // 4x4 grid
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          children: buttonNames.map<Widget>((e) {
            switch (e) {
              case "+": // Addition Button
                return _buildFancyButton(e, isBottom: true);
              case "×": // Multiplication Button
                return _buildFancyButton(e);
              case "−": // Subtraction Button
                return _buildFancyButton(e);
              case "÷": // Division Button
                return _buildFancyButton(e, isTop: true);
              default:
                return _button(e, 0);
            }
          }).toList()),
    );
  }

  // Normal button
  Widget _button(text, double paddingBot) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(100)), // Circular
        color: Color.fromRGBO(230, 230, 230, 1),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return InkWell(
              // Ripple Effect
              borderRadius: BorderRadius.all(Radius.circular(100)),
              onTap: () {
                _buttonPressed(text);
              },
              child: Container(
                // For ripple area
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color.fromRGBO(94, 94, 94, 1),
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // Operator Button
  Widget _buildFancyButton(text, {bool isTop = false, bool isBottom = false}) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, isTop ? 8 : 0, 8, isBottom ? 8 : 0),
      child: Material(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(
            top: isTop ? Radius.circular(100.0) : Radius.circular(0),
            bottom: isBottom ? Radius.circular(100.0) : Radius.circular(0)),
        child: InkWell(
          borderRadius: BorderRadius.vertical(
              top: isTop ? Radius.circular(100.0) : Radius.circular(0),
              bottom: isBottom ? Radius.circular(100.0) : Radius.circular(0)),
          onTap: () {
            _buttonPressed(text);
          },
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Color.fromRGBO(255, 211, 215, 1),
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(" Intermediate Calculator"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              //showResultHistory(equation, "=", result);
              _navigateAndDisplayHistory(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () {
              //UndoRedo("undo");
              showResultHistory(equation, "=", result);
            },
          ),
          IconButton(
            icon: Icon(Icons.redo),
            onPressed: () {
              showResultHistory(equation, "=", result);
              // UndoRedo("redo");
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            // Expression Area - Top - Smallest Size
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 12.5, right: 12.5),
              decoration: BoxDecoration(
                // Bottom Divider
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(227, 227, 227, 1),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // Expression
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: Row(
                      children: <Widget>[
                        Text(equation,
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(152, 152, 152, 1),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Spacer(),
                  FlatButton(
                    // equal to btn
                    child: Text(
                      "=",
                      style: TextStyle(
                          fontSize: 36,
                          color: Color.fromRGBO(200, 200, 200, 1),
                          fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      showResultDialog(result);
                    },
                  ),
                  Container(
                    // Clear Btn
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () => {_buttonPressed("×", isClear: true)},
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 45,
                            child: Text(
                              "×",
                              style: TextStyle(
                                  fontSize: 36,
                                  color: Color.fromRGBO(200, 200, 200, 1),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            // Controls Area - Bottom - Max Size Ration
            flex: 6,
            child: _buildButtons(),
          )
        ],
      ),
    );
  }

  _navigateAndDisplayHistory(BuildContext context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => History(operations: cal)));
  }

  void showResultHistory(String eq, String equal, String history) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          AnimationController(duration: Duration(seconds: 60), vsync: this);
          return AlertDialog(
            title: new Text(
              "History",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Dancing Script',
                color: Colors.blue,
                fontSize: 28.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            content: Row(
              children: [
                Text(
                  eq,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  equal,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  result,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void showResultDialog(String playerName) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          AnimationController(duration: Duration(seconds: 60), vsync: this);
          return AlertDialog(
            title: new Text(
              "Result",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Dancing Script',
                color: Colors.blue,
                fontSize: 28.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            content: Text(
              playerName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontStyle: FontStyle.italic,
                fontSize: 23.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void UndoRedo(String n) {
    if (n == "undo") {
      if (ur < undoresult.length) {
        result = undoresult[ur];
        redoresult.add(result);
        ur = ur + 1;
        rr = rr + 1;
      }

      if (ur < undoresult.length) {
        equation = undoequation[ue];
        redoequation.add(equation);
        ue = ue + 1;
        re = re + 1;
      }

      if (n == "redo") {
        if (inc < rr) {
          result = redoresult[inc];
          inc = inc + 1;
          ur = ur - 1;
        }

        if (inc2 < re) {
          equation = redoequation[inc2];
          inc2 = inc2 + 1;
          ue = ue - 1;
        }
      }
    }
  }
}

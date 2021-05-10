import 'package:flutter/material.dart';

import 'history.dart';

class AddTwoNumbers extends StatefulWidget {
  @override
  _AddTwoNumbersState createState() => _AddTwoNumbersState();
}

List<String> cal = [];

class _AddTwoNumbersState extends State<AddTwoNumbers>
    with TickerProviderStateMixin {
  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  String resulttext = "0";
  String ma = "";
  String eq;

  void historymain() {
    // ma = result.toString() + " = " + resulttext;
    cal.add(resulttext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(" Simple Calculator"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              //showResultHistory(equation, "=", result);
              _navigateAndDisplayHistory();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          //Spacer(),
          SizedBox(
            height: 60.0,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "   1st Value:    ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  new Flexible(
                    child: new TextField(
                      keyboardType: TextInputType.number,
                      controller: num1controller,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "   2nd Value:   ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  new Flexible(
                    child: new TextField(
                      keyboardType: TextInputType.number,
                      controller: num2controller,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 45.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        int result = int.parse(num1controller.text) +
                            int.parse(num2controller.text);
                        resulttext = result.toString();
                        eq = result.toString() + "=" + resulttext;

                        historymain();
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: Text(
                      "-",
                      style: TextStyle(
                        fontSize: 45.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        int result = int.parse(num1controller.text) -
                            int.parse(num2controller.text);
                        resulttext = result.toString();
                        eq = result.toString() + "=" + resulttext;
                        historymain();
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: Text(
                      "*",
                      style: TextStyle(
                        fontSize: 45.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        int result = int.parse(num1controller.text) *
                            int.parse(num2controller.text);
                        resulttext = result.toString();
                        eq = result.toString() + "=" + resulttext;
                        historymain();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 45.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        double result = double.parse(num1controller.text) /
                            double.parse(num2controller.text);
                        resulttext = result.toStringAsPrecision(3);
                        eq = result.toString() + "=" + resulttext;
                        historymain();
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: Text(
                      "%",
                      style: TextStyle(
                        fontSize: 45.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        double result = double.parse(num1controller.text) /
                            double.parse(num2controller.text);
                        resulttext = result.toStringAsPrecision(3);
                        eq = result.toString() + "=" + resulttext;
                        historymain();
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: Text(
                      "<",
                      style: TextStyle(
                        fontSize: 45.0,
                      ),
                    ),
                    onPressed: () {
                      showResultDialog(resulttext);
                    },
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0))),
                    // equal to btn
                    child: Text(
                      "=",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      showResultDialog(resulttext);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resulttext,
                    style: TextStyle(
                      color: Color.fromRGBO(200, 200, 200, 1),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _navigateAndDisplayHistory() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => History(operations: cal),
    ));
  }

  void showResultDialog(String res) async {
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
                fontSize: 28.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            content: Text(
              res,
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
}

import 'package:flutter/material.dart';
import 'calculator.dart';

class History extends StatelessWidget {
  History({@required this.operations});

  final List<String> operations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: false,
      ),
      body: Center(
        child: _operationsList(operations),
      ),
    );
  }

  Widget _operationsList(List<String> operations) {
    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue[800], width: 1.0),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              Calculator.parseString(operations[i]),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(5),
          ),
        );
      },
    );
  }
}

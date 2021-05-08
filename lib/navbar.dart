import 'package:flutter/material.dart';
import 'package:calculator_app/contactus.dart';
import 'package:calculator_app/demo.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> listWidgets = [WelcomeScreen(), ContactUs()];
  List<IconData> listIcons = [
    Icons.home,
    Icons.email,
    Icons.supervised_user_circle,
  ];
  List<String> listTitles = ['Home', 'Contact Us'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.amberAccent,
        title: Text(listTitles[selectedIndex], style: TextStyle()),
      ),
      body: listWidgets[selectedIndex],
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/aqii.jpg'),
                //radius: 50.0,
              ),
              accountName: Text('Aqsa Tariq'),
              accountEmail: Text('aqsatariq211@gmail.com'),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 0),
              itemCount: listWidgets.length,
              itemBuilder: (context, position) {
                return (ListTile(
                  leading: Icon(listIcons[position]),
                  title: Text(listTitles[position]),
                  onTap: () {
                    setState(() {
                      selectedIndex = position;
                    });
                    Navigator.of(context).pop();
                  },
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}

library contactus;

import 'package:flutter/material.dart';
import 'package:calculator_app/constants.dart';
//import 'package:typicons_flutter/typicons_flutter.dart';
//import 'package:url_launcher/url_launcher.dart';

///Class for adding contact details/profile details as a complete new page in your flutter app.
class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Let\'s Connect',
              style: TextStyle(
                fontFamily: 'Lobster',
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
              ),
            ),
            SizedBox(
              height: 50.0,
              width: 450.0,
              child: Divider(
                color: Colors.indigoAccent,
                thickness: 1.0,
              ),
            ),
            Text(
              'We\'d love to help you start exceeding your Goals',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                //letterSpacing: 5.0,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.black54,
                  size: 30.0,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Your Name here...",
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.phone_android,
                  color: Colors.black54,
                  size: 30.0,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Your Phone no here...",
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.email_sharp,
                  color: Colors.black54,
                  size: 30.0,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Your Email here...",
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.attach_email_outlined,
                  color: Colors.black54,
                  size: 30.0,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Write your message...",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
              width: 450.0,
            ),
            InkWell(
              //onTap: () => Get.to(WelcomeScreen()),
              child: Container(
                width: 200.0,
                margin: EdgeInsets.only(left: 15.0, top: 0.0),
                alignment: Alignment.center,
                padding: EdgeInsets.all(kDefaultPadding * 0.90), // 15
                decoration: BoxDecoration(
                  //gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  "Send Us",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.black, fontSize: 19.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

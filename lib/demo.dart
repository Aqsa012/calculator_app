import 'package:calculator_app/body2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_app/constants.dart';

import 'body.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _MyWelcomeScreen createState() => _MyWelcomeScreen();
}

class _MyWelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white10,
      body: Stack(
        children: [
          //WebsafeSvg.asset("assets/icons/triangles.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2

                  Image(
                    image: AssetImage('assets/school.png'),
                    height: 200,
                    width: 200,
                  ), // /6
                  Text(
                    "Calculator",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.indigo, fontWeight: FontWeight.bold),
                  ),

                  Text("Calculate your values!"),

                  SizedBox(
                    height: 60.0,
                  ),
                  InkWell(
                    onTap: () => Get.to(AddTwoNumbers()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 1), // 15
                      decoration: BoxDecoration(
                        color: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Simple",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black, fontSize: 19.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () => Get.to(HomePage2()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 1), // 15
                      decoration: BoxDecoration(
                        color: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Hard",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black, fontSize: 19.0),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), //
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

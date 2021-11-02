import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: WaitSignIn(),
  ));
}

class WaitSignIn extends StatelessWidget {
  const WaitSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff02bbd2),
        body: Center(
            child: Column(
                children: [
              Image.asset('images/Logo.PNG'),
              Column(
                children: [
                  Text('SignIn',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  Text('Speak, friend, and enter',
                      style: TextStyle(fontWeight: FontWeight.w300)),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 150),
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    size: 50.0,
                  )),
            ])));
  }
}

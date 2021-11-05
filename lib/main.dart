import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _mainSignIn = MainSignIn();
    return _mainSignIn;
  }
}

class MainSignIn extends StatefulWidget {
  @override
  MainSignInState createState() => MainSignInState();
}

class MainSignInState extends State<MainSignIn> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget imgSection = Image.asset(
      'images/Logo.jpg',
      alignment: Alignment.center,
      width: 150,
      height: 150,
    );
    Widget TextSection = Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'SignIn',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
          Text('Speak, friend, and enter'),
        ],
      ),
    );
    Widget LoginSection = Container(
      child: Column(
        children: [
          Container(
            width: 450,
            height: 50,
            margin: EdgeInsets.only(bottom: 10),
            child: TextField(
              controller: _controller1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
                fillColor: Colors.white,
                filled: true,
              ),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          Container(
            width: 450,
            height: 50,
            child: TextField(
              controller: _controller2,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                fillColor: Colors.white,
                filled: true,
              ),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
        ],
      ),
    );
    Widget SignInButton = Container(
      width: 450,
      height: 50,
      child: TextButton(
        child: Text(
          'SIGN IN',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if (_controller1.text == _controller2.text) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WaitSignIn()));
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xff02bbd2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            imgSection,
            TextSection,
            LoginSection,
            SignInButton,
          ],
        ),
      ),
    );
  }
}

class ErroSignIn extends StatelessWidget {
  const ErroSignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget imgsection = Image.asset(
      'images/logo2.png',
      alignment: Alignment.center,
      width: 200,
      height: 200,
    );
    Widget textSection = Container(
        padding: EdgeInsets.all(50),
        child: Row(children: [
          Expanded(
            child: Text("UPS... couldn't Sign in",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          Text("Your username and password don't match.",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center),
          Text(
            "Please,try again",
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ]));

    Widget TryAgainButton = Container(
      margin: EdgeInsets.only(top: 200),
      width: 450,
      height: 50,
      child: TextButton(
        child: Text(
          'TRY AGAIN',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
    );

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Column(
          children: [imgsection, textSection, TryAgainButton],
        ),
      ),
    );
  }
}

class WaitSignIn extends StatefulWidget {
  @override
  WaitSignInState createState() => WaitSignInState();
}

class WaitSignInState extends State<WaitSignIn> {
  @override
  void initState() {
    //Dem nguoc 3s roi mo trang main signin
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => EmailPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff02bbd2),
        body: Center(
            child: Column(children: [
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
              margin: EdgeInsets.only(top: 150),
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              )),
        ])));
  }
}

class EmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Email'));
  }
}

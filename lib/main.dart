import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MainSignIn(),
  ));
}
class MainSignIn extends StatelessWidget{
  const MainSignIn ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Widget imgSection = Image.asset('images/Logo.jpg',
      alignment: Alignment.center,
      width: 150,
      height: 150,
    );
    Widget TextSection = Container(
      child: Column(
        children: [
          Container(
            child: Text('SignIn',
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
        child: Text('SIGN IN',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: (){},
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
                  margin: EdgeInsets.only(top: 150),
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    size: 50.0,
                  )),
            ])));
  }
}

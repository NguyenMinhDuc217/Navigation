import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
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
          if (_controller1.text.trim() == " " ||
              _controller2.text.trim() == "") {
            showDialog(
                context: context,
                builder: (BuildContext) => AlertDialog(
                      title: Text('Thông báo'),
                      content: Text('Chưa nhập thông tin!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ));
          } else if (_controller1.text == _controller2.text) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WaitSignIn()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ErrorSignIn()));
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

class ErrorSignIn extends StatelessWidget {
  const ErrorSignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget imgsection = Image.asset(
      'images/LogoError.JPG',
      alignment: Alignment.center,
      width: 200,
      height: 200,
    );
    Widget textSection = Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(children: [
          Text("UPS... couldn't Sign in",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
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
      margin: EdgeInsets.only(bottom: 70),
      width: 450,
      height: 50,
      child: TextButton(
        child: Text(
          'TRY AGAIN',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(children: [
          Expanded(
            child: Column(children: [imgsection, textSection]),
          ),
          TryAgainButton
        ]),
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
          Image.asset('images/Logo.jpg'),
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

class EmailBoxes{
  late IconData icon;
  late Color color;
  late String lablel;
  late int number;
  bool isChecked = false;
  EmailBoxes(IconData _icon, Color _color, String _lablel, int _number){
    icon=_icon;
    color=_color;
    lablel=_lablel;
    number=_number;
  }
}
class EmailPage extends StatefulWidget{
  @override
  EmailPageState createState()=>EmailPageState();
}
class EmailPageState extends State<EmailPage> { 
List<EmailBoxes> mail=[
    EmailBoxes(Icons.inbox,Colors.blue,"All inboxes",55),
    EmailBoxes(Icons.cloud,Colors.blue,"ICloud",14),
    EmailBoxes(Icons.email,Colors.blue,"Gmail",43),
    EmailBoxes(Icons.email_outlined,Colors.blue,"Hotmail",12),
    EmailBoxes(Icons.folder_special_outlined,Colors.blue,"VIP",5),
    EmailBoxes(Icons.security_outlined,Colors.blue,"Secure",2),
    EmailBoxes(Icons.circle_notifications_outlined,Colors.blue,"Notificatons",99),
  ];

  @override
  Widget build(BuildContext context) {
    Widget textMailBoxes=Container(
      color: Colors.grey[300],
      padding: EdgeInsets.fromLTRB(5, 10, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('MailBoxes'),
        ],
      ),
    );
    Widget textSpecialFolder=Container(
      color: Colors.grey[300],
      padding: EdgeInsets.fromLTRB(5, 10, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Special_Folder'),
        ],
      ),
    );
    Row BuildMailBoxes(int stt, IconData icon, Color color, String label, int number){
  return Row(
    children: [
      Expanded(
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.red,
              value: mail[stt].isChecked, 
              onChanged: (bool? value){
                setState(() {
                mail[stt].isChecked=value!;
                });
              }
            ),
            Icon(
              icon,
              color: color,
            ),
            Text(
              label
            ),
          ],
        )
      ),
      Container(
        padding: EdgeInsets.only(right: 20),
        child: Text(
        number.toString(),
      ),
      )
    ],
  );
}
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        centerTitle: true,
        title: Text(
          'Mainboxes',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Done',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                textMailBoxes,
               BuildMailBoxes(0, mail[0].icon, mail[0].color, mail[0].lablel, mail[0].number),
               BuildMailBoxes(1, mail[1].icon, mail[1].color, mail[1].lablel, mail[1].number),
               BuildMailBoxes(2, mail[2].icon, mail[2].color, mail[2].lablel, mail[2].number),
               BuildMailBoxes(3, mail[3].icon, mail[3].color, mail[3].lablel, mail[3].number),
               BuildMailBoxes(4, mail[4].icon, mail[4].color, mail[4].lablel, mail[4].number),
               textSpecialFolder,
               BuildMailBoxes(5, mail[5].icon, mail[5].color, mail[5].lablel, mail[5].number),
               BuildMailBoxes(6, mail[6].icon, mail[6].color, mail[6].lablel, mail[6].number),
              ],
            ),
          )
        ],
      ),
      persistentFooterButtons:[
        Stack(
          children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text('Delete',style: TextStyle(fontSize:24)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){
              mail.forEach((element) {
                if(element.isChecked==true){
                  element.number=0;
                  element.isChecked=false;
                }
                setState(() {});
              },  
              );
            }, icon: Icon(Icons.delete))
          ),
        ])
      ],
    );
  }
}

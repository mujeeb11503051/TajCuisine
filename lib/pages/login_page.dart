import 'package:flutter/material.dart';
import 'package:test_demo22/pages/Login_page2.dart';
import 'package:test_demo22/pages/RegForm_page.dart';
import 'package:test_demo22/pages/service_type.dart';
import 'package:test_demo22/viewmodel/UserVM.dart';

import 'TimePicker_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserVM userVM = new UserVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(
              'images/iconTaj.png',
              width: 250,
              height: 250,
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 140, 5, 0),
                //margin: EdgeInsets.fromLTRB(5.0, 170.0, 5.0, 0),
                width: 250,
                child: Text(
                    "By using this App you agree to the Privacy Policy & Terms & Conditions",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            Expanded(
                flex: 0,
                child: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new SizedBox(
                            width: 150,
                            child: OutlineButton(
                                key: null,
                                onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserLogin(userVM: userVM)))
                                    },
                                color: Colors.white24,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                                child: Text("Login",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto"))),
                          ),
                          new SizedBox(
                            width: 150,
                            child: OutlineButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                                key: null,
                                onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegFormPage()))
                                      //Navigator.pushNamed(context, '/timePicker')},
                                    },
                                color: Color.fromRGBO(242, 116, 5, 1),
                                child: Text("Sign Up",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto"))),
                          ),
                        ]))),
            Expanded(
              flex: 4,
              child: Container(
                //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new SizedBox(
                      width: 150,
                      child: OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                          borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1),
                          onPressed: () => {
                                //Navigator.push(context, ),
                                userVM.getGuestAuth().then((value) =>
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ServiceTypePage(
                                                  userVm: userVM,
                                                )))),
                                //Navigator.pushNamed(context, '/guest2')
                              },
                          color: Color.fromRGBO(242, 116, 5, 1),
                          child: Text("Continue as Guest",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: ""))),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

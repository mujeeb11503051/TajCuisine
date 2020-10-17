import 'package:flutter/material.dart';
import 'package:test_demo22/pages/service_type.dart';

// this class is used to invoke the page that contains the user name field and password

class UserLogin extends StatefulWidget {
  static const String routeName = '/login';
  final userVM;
  UserLogin({this.userVM});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<UserLogin> {
  //final _loginBloc = LoginBloc();
  String _userName;
  String _passwd;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Image.asset(
                    'images/iconTaj.png',
                    width: 150.0,
                    height: 200.0,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _userName = value;
                      },
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _passwd = value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          child: FlatButton(
                            onPressed: () => {
                              !_formKey.currentState.validate()
                                  ? null
                                  : _formKey.currentState.save(),
                              widget.userVM
                                  .getUserAuth(_userName, _passwd)
                                  .then((value) => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ServiceTypePage(
                                                userVm: widget.userVM,
                                              )))),
                            },
                            color: Color.fromRGBO(242, 116, 5, 1),
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto")),
                          ),
                        ),
                      ]),
                ),
              ],
            ))
        //LoginScreen(loginBloc: _loginBloc),
        );
  }
}

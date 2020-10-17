import 'package:flutter/material.dart';
import 'package:test_demo22/model/UserRegDetails..dart';
import 'package:test_demo22/viewmodel/UserVM.dart';

class RegFormPage extends StatefulWidget {
  static const String routeName = '/regForm';

  @override
  _RegFormPageState createState() => _RegFormPageState();
}

class _RegFormPageState extends State<RegFormPage> {
  UserVM userVM = new UserVM();
  UserRegDetails userDtls;
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _email;
  String _password;
  String _cpassword;
  var listUsr = new List<UserRegDetails>();
  //final _regFormBloc = RegFormBloc();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'First Name - Required',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Required';
                    }
                    return _firstName = value;
                  },
                  onSaved: (String value) {
                    _firstName = value;
                  },
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Last Name - Required',
                    prefixIcon: Icon(Icons.perm_identity),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Required';
                    }
                    return _lastName = value;
                  },
                  onSaved: (String value) {
                    _lastName = value;
                  },
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number - Required',
                    prefixIcon: Icon(Icons.phone_iphone),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Required';
                    }
                    return _phoneNumber = value;
                  },
                  onSaved: (String value) {
                    _phoneNumber = value;
                  },
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email Address - Required',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Required';
                    }
                    return _email = value;
                  },
                  onSaved: (String value) {
                    _email = value;
                  },
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Required';
                    }
                    return _password = value;
                  },
                  onSaved: (String value) {
                    _password = value;
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onSaved: (String value) {
                    _cpassword = value;
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Required';
                    }
                    _cpassword = value;
                    if (_password != _cpassword) {
                      return "Password doesn't match";
                    }
                    return _cpassword;
                  },
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
              FlatButton(
                onPressed: () => {
                  !_formKey.currentState.validate()
                      ? null
                      : _formKey.currentState.save(),
                  print("$_firstName dvdvd"),
                  print(_lastName),
                  print(_phoneNumber),
                  print(_email),
                  userDtls = new UserRegDetails("", "1", _firstName, _lastName,
                      _phoneNumber, "", _email, _password, true),
                  userVM.registerUser(userDtls)
                },
                color: Color.fromRGBO(242, 116, 5, 1),
                child: Text("Sign Up",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto")),
              ),
            ],
          ),
        ),
      ), //RegFormScreen(regFormBloc: _regFormBloc)
    );
  }
}

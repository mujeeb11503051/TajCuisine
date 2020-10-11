import 'package:flutter/material.dart';

class RegFormPage extends StatefulWidget {
  static const String routeName = '/regForm';

  @override
  _RegFormPageState createState() => _RegFormPageState();
}

class _RegFormPageState extends State<RegFormPage> {
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
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Last Name - Required',
                      prefixIcon: Icon(Icons.perm_identity),
                    ),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Phone Number - Required',
                      prefixIcon: Icon(Icons.phone_iphone),
                    ),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email Address - Required',
                      prefixIcon: Icon(Icons.email),
                    ),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ) ,//RegFormScreen(regFormBloc: _regFormBloc)
        );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LocationDetails extends StatefulWidget {
  final userVM;

  LocationDetails({this.userVM});

  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  String _streetAddress;
  String _suite;
  String _city;
  String _state;
  String _zipCode;
  String _deliveryInstructions;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //=================================== Street Address ==============================
  Widget _buildStreetAddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Street Address (Required)'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required';
        }
        return null;
      },
      onSaved: (String value) {
        _streetAddress = value;
      },
    );
  }

  //================================= Suit ===========================================
  Widget _buildSuite() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Suite/Apt # (Optional)'),
      onSaved: (String value) {
        _suite = value;
      },
    );
  }

  //================================= City ===========================================
  Widget _buildCity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'City (Required)'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required';
        }
        return null;
      },
      onSaved: (String value) {
        _city = value;
      },
    );
  }

  //================================= State ========================================
  Widget _buildState() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'State (Required)'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required';
        }
        return null;
      },
      onSaved: (String value) {
        _state = value;
      },
    );
  }

  //=============================== ZipCode =======================================
  Widget _buildZipCode() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Zip Code (Required)'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required';
        }
        return null;
      },
      onSaved: (String value) {
        _zipCode = value;
      },
    );
  }

  //=============================== Delivery Instructions ==========================
  Widget _buildDeliveryInstructions() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Delivery Instructions (Optional)'),
      onSaved: (String value) {
        _deliveryInstructions = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Delivery Address',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.workspaces_filled), onPressed: null)
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[400],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enter House Address',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue[900]),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildStreetAddress(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildSuite(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildCity(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildState(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildZipCode(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildDeliveryInstructions(),
            ),
            Container(
                color: Colors.red,
                child: FlatButton(
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      print(_streetAddress);
                      print(_suite);
                      print(_city);
                      print(_state);
                      print(_zipCode);
                      print(_deliveryInstructions);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(userVM: this.widget.userVM)));
                    },
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}

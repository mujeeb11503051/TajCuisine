import 'package:flutter/material.dart';

import 'TimePicker_page.dart';

class ServiceTypePage extends StatefulWidget {
  final userVm;

  ServiceTypePage({this.userVm});
  @override
  _ServiceTypePageState createState() => _ServiceTypePageState();
}

class _ServiceTypePageState extends State<ServiceTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: () {},
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          'Welcome',
          style: TextStyle(color: Colors.black),
        )),
        actions: [
          IconButton(icon: Icon(Icons.workspaces_filled), onPressed: null)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 125),
            child: Center(child: Image.asset('images/iconTaj.png')),
          ),
          //======================================== View Menu ==================================================
          Padding(
            padding: const EdgeInsets.only(top: 170),
            child: Container(
                height: 50,
                width: 250,
                color: Colors.red[900],
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'VIEW MENU',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
          ),
          //=========================================== Order to GO ===================================
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
                height: 50,
                width: 250,
                color: Colors.red[900],
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => TimePickerPage(
                                userVM: widget.userVm,
                              )));
                    },
                    child: Text(
                      'ORDER TO GO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
          ),
          //============================================== Delivery =====================================
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
                height: 50,
                width: 250,
                color: Colors.red[900],
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => TimePickerPage(
                                typeOfServiceFlag: 1,
                                userVM: widget.userVm,
                              )));
                    },
                    child: Text(
                      'DELIVERY',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
          )
        ],
      ),
    );
  }
}

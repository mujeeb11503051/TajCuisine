import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_demo22/main.dart';
import 'package:test_demo22/pages/loc_details.dart';
import 'package:test_demo22/viewmodel/TimesetterVM.dart';
import 'package:intl/intl.dart';

class TimePickerPage extends StatefulWidget {
  static const String routeName = '/timePicker';
  final userVM;

  final typeOfServiceFlag;
  TimePickerPage({this.userVM, this.typeOfServiceFlag});
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  DateTime dt;
  var initDT;
  var msg;
  TimeSetterVM vm;

  _TimePickerPageState() {
    vm = new TimeSetterVM();
    //if (this.widget?.user == null) vm.getAuthenticated("", "");
    //this.widget.user = User.instance;
    //this.widget.user = vm.user;
    this.initDT = vm.getDateTime;
    //this.dt = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('fsg'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(30, 15, 10, 15),
                child: Text(
                  "Schedule an order up to 2 days in advance",
                )),
            SizedBox(
                height: 300,
                child: DefaultTextStyle.merge(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lime,
                        inherit: false),
                    child: CupertinoDatePicker(
                        use24hFormat: false,
                        minuteInterval: 30,
                        initialDateTime: initDT,
                        mode: CupertinoDatePickerMode.dateAndTime,
                        minimumDate: initDT,
                        maximumDate: initDT.add(Duration(days: 2)),
                        onDateTimeChanged: (datetime) => {
                              setState(() {
                                dt = datetime;
                                print(dt);
                                vm.setDateTime(dt);
                              })
                            }))),
            Expanded(
                flex: 2,
                child: Text(
                  "Pick Up Time " +
                      (dt == null
                          ? new DateFormat("MMM d").format(vm.getDateTime) +
                              " at " +
                              new DateFormat(" hh:mm a").format(vm.getDateTime)
                          : (new DateFormat("MMM d").format(dt).toString() +
                              " at " +
                              new DateFormat(" hh:mm a").format(dt))),
                  // dt.hour.toString().padLeft(2, "0") +
                  // ":" +
                  // dt.minute.toString().padLeft(2, "0"))),
                  style: TextStyle(
                      color: Colors.orange[900],
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )),
            Expanded(
              flex: 1,
              child: SizedBox(
                  height: 10,
                  child: RaisedButton(
                    onPressed: () => {
                      //push to contex and pop new page
                      if (vm.timeSetter != null)
                        {
                          this.widget.userVM.setdeliveryTime(vm.getDateTime),
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         MenuItemsPage(vm: this.widget.userVM),
                          //   ),
                          //)

                          if (widget.typeOfServiceFlag != null)
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LocationDetails(
                                            userVM: this.widget.userVM,
                                          )))
                            }
                          else
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(userVM: this.widget.userVM)))
                            }
                        }
                    },
                    child: Text(
                      "Save and Continue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                    color: Colors.orange[900],
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                  )),
            ),
            Container(
              margin: EdgeInsets.all(20),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:test_demo22/model/TimeSetter.dart';

class TimeSetterVM {
  TimeSetter timeSetter;
  TimeSetterVM() {
    this.timeSetter = new TimeSetter();
    var dt = DateTime.parse(DateTime.now().year.toString() +
        "-" +
        DateTime.now().month.toString().padLeft(2, "0") +
        "-" +
        DateTime.now().day.toString().padLeft(2, "0") +
        " " +
        (DateTime.now().hour.toString().length == 1
            ? "0" + DateTime.now().hour.toString()
            : DateTime.now().hour.toString()) +
        ":30:00"); //replace with webservice datetime
    this.timeSetter.date = dt.year.toString() +
        "-" +
        dt.month.toString().padLeft(2, "0") +
        "-" +
        dt.day.toString().padLeft(2, "0");

    this.timeSetter.hour = (dt.hour.toString().padLeft(2, "0"));
    this.timeSetter.minute = dt.minute.toString().padLeft(2, "0");
  }

  get getDateTime {
    return DateTime.parse(this.timeSetter.date +
        " " +
        this.timeSetter.hour.toString().padLeft(2, "0") +
        ":" +
        this.timeSetter.minute.toString().padLeft(2, "0") +
        ":" +
        "00");
  }

  void setDateTime(DateTime dt) {
    try {
      this.timeSetter.date = dt.day.toString().padLeft(2, "0") +
          "-" +
          dt.month.toString().padLeft(2, "0") +
          "-" +
          dt.year.toString().padLeft(2, "0");
      this.timeSetter.hour = dt.hour.toString().padLeft(2, "0");
      this.timeSetter.minute = dt.minute.toString().padLeft(2, "0");
    } catch (e) {
      print(e.toString());
    }
  }
}

class TimeSetterNotifierVM extends ChangeNotifier {
  TimeSetterVM dateTime;
  // Future void setTimetoScreen() async{

  // }
}

import 'User.dart';

class TimeSetter {
  String date;
  String hour;
  String minute;
  int outlet_Id;
  String lunch_Start;
  String lunch_End;
  String dinner_Start;
  String dinner_End;
  String selectedDay;
  bool active;


  TimeSetter(
      {this.outlet_Id,
      this.lunch_Start,
      this.lunch_End,
      this.dinner_Start,
      this.dinner_End,
      this.active,
      this.selectedDay});
  factory TimeSetter.fromJson(Map<String, dynamic> json) {
    return TimeSetter(
      outlet_Id: json["outletId"],
        selectedDay:json['day'],
      lunch_Start: json["lunch_Start"],
      lunch_End: json["lunch_End"],
      dinner_Start: json['dinner_Start'],
      dinner_End: json['dinner_End'],
      active: json['active']
    );
  }
}

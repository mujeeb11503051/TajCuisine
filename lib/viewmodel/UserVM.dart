

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/User.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/services/ServiceCalls.dart';

class UserVM with ChangeNotifier {
  User user;
  UserVM() {
    if (user == null) user = User.instance;
  }
  void addtoCart(Map <String, CartItem> item){
   // if(this.user.order==null){
   //    this.user.order = new Map<String, CartItem>() ;
   //    this.user.order.addAll(item);
   // }
    // else{
    //  this.user.order.
    // }
    /*
     int prdId;
  double quantity;
  double quantity;
  String spicyLevel;
  String addInfo;
  int favorite;
    */

    this.user.itemResp = new List<ItemResponse>();

    item.forEach((key, value) {
      var itemList = new ItemResponse();
      itemList.prdId = value.id;
      itemList.spicyLevel = value.spicyLevel;
      itemList.price = value.price;
      itemList.addInfo = value.typedDescription;
      itemList.favorite = null;
      this.user.itemResp.add(itemList);
    });
    //this.user.itemResp.add(new ItemResponse{prdid = )})
  }
  get getUserDetails {
    return this.user;
  }

  void setdeliveryTime(DateTime dt) {
    user.delDateTime = dt.day.toString().padLeft(2, "0") +
        "-" +
        dt.month.toString().padLeft(2, "0") +
        "-" +
        dt.year.toString().padLeft(2, "0") +
        " " +
        dt.hour.toString().padLeft(2, "0") +
        ":" +
        dt.minute.toString().padLeft(2, "0");
  }
 void placeOrder(UserVM userOrder) async{
   await ServiceCalls().saveOrderNCheckout(userOrder);
 }
  Future<void> getAuthenticated(String uname, String passwd) async {
    this.user = await ServiceCalls().getUserdetails(uname, passwd);
  }

  Future<void> getGuestAuth() async {
    //if (ServiceCalls().storage.read(key: "Jwt") == null) {
    this.user =
        await ServiceCalls().getUserdetails("guest@gmail.com", "password");
    //.catchError((onError) => {print("Service not available " + onError)});
    //}
  }
}

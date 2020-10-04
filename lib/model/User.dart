import 'dart:convert';

import 'package:test_demo22/model/cart.dart';

class User {
  String userID;
  String outletID;
  String userRole;
  String fName;
  String lName;
  String phone;
  String email;
  String payMode;
  String payStatus;
  String status;
  String tax;
  String discount;
  String total;
  String netTotal;
  String date;
  String orderDate;
  String orderTime;
  bool isActive;
  bool optForOffer;
  //Map<String, CartItem> order;
  List<ItemResponse> itemResp;
  String delDateTime;
  User._privateConstructor();
  static final User instance = User._privateConstructor();
  User.fromJson(Map<String, dynamic> json)
      : fName = json['firstName'],
        email = json['username'],
        isActive = json['active'],
        userID = json['userId'],
        userRole = json['roleId'].toString();
  Map toJson() {
    List<Map> items = this.itemResp != null
        ? this.itemResp.map((i) => i.toJson()).toList()
        : null;
    return {
      'id': 0,
      'outletId': 1,
      'ordNum': "",
      'usrId': "145d32e9-0ab3-499a-a54b-b292effd72ab",
      'firstName': fName,
      'lastName': lName,
      'telephone': phone,
      'email': email,
      'payMode': payMode,
      'payStatus': payStatus,
      'status': 0,
      'total': total,
      'tax': tax,
      'discount': 0,
      'netTotal': netTotal,
      'date': DateTime.now().toString(),
      'orderDate': orderDate,
      'orderTime': orderTime,
      'items': items
    };
  }
}

class ItemResponse {
  String prdId;
  double quantity;
  String productName;
  double price;
  String spicyLevel;
  String addInfo;
  int favorite;
  Map toJson() {
    return {
      'id': 0,
      'ordId': 0,
      'prdId': prdId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'spicyLevel': spicyLevel == null ? "" : spicyLevel,
      'addInfo': addInfo != null ? addInfo : "",
      'favorite': favorite == null ? 0 : favorite
    };
  }
}
/*
 public int Id { get; set; }
        public int OutletId { get; set; }
        public string UsrId { get; set; }
        public string OrdNum { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Telephone { get; set; }
        public string Email { get; set; }
        public int PayMode { get; set; }  // '1 - PAY AT STORE, 2 - CREDIT CARD'
        public int PayStatus { get; set; }  // '1 - UNPAID, 2 - PAID'
        public int Status { get; set; }  //   '1 - REQUESTED, 2 - INPROGRESS, 3 - READY, 4 - DELETED, 5 - FAKE'
        public double Total { get; set; }
        public double Tax { get; set; }
        public double Discount { get; set; }
        public double NetTotal { get; set; }
        public DateTime Date { get; set; }
        public DateTime OrderDate { get; set; }
        public string OrderTime { get; set; }
        public List<ItemResponse> Items { get; set; }
*/

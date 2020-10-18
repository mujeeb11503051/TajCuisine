import 'dart:convert';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:test_demo22/model/ProductCategory.dart';
import 'package:test_demo22/model/ProductModel.dart';
import 'package:test_demo22/model/TimeSetter.dart';
import 'package:test_demo22/model/User.dart';
import 'package:test_demo22/model/UserRegDetails..dart';
import '../viewmodel/UserVM.dart';

class ServiceCalls {
  final storage = new FlutterSecureStorage();
  Future<List<ProductCategory>> getMenuItems() async {
    var token = await storage.read(key: 'Jwt');
    final response =
        await http.get('http://10.0.2.2:5000/ProductCategory/getall', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json
          .map((products) => ProductCategory.fromJson(products))
          .toList();
    } else {
      throw Exception("Error downloading MenuItems");
    }
  }

//call to get authenticated
  Future<User> getUserdetails(String email, String passwd) async {
    //tokenStore = new FlutterSecureStorage();
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{username: "$email", password: "$passwd"}';
    final response = await http.post('http://10.0.2.2:5000/auth/authenticate',
        headers: headers, body: json);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      var user = User.fromJson(json);
      await storage.write(key: 'Jwt', value: json['token']);
      return user;
    } else {
      throw Exception("Auth Error");
    }
  }

  ///
  /// Save/Register user
  ///
  Future<bool> saveUserDetails(UserRegDetails userDtls) async {
    bool success;
//String accesstoken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjE0NWQzMmU5LTBhYjMtNDk5YS1hNTRiLWIyOTJlZmZkNzJhYiIsIm5hbWVpZCI6Imd1ZXN0QGdtYWlsLmNvbSIsInJvbGUiOiJHdWVzdCIsIm5iZiI6MTYwMjc4NDU3NywiZXhwIjoxNjAyODcwOTc3LCJpYXQiOjE2MDI3ODQ1Nzd9.9jxr4j-Mq5zBAI5-Ar8QoqnyfPksx6Bs6CZxWJYBIX0';
//String refreshtoken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpAVD89.eyJ1bmlxdWVfbmFtZSI6IjE0NWQzMmU5LTBhYjMtNDk5YS1hNTRiLWIyOTJlZmZkNzJhYiIsIm5hbWVpZCI6Imd1ZXN0QGdtYWlsLmNvbSIsInJvbGUiOiJHdWVzdCIsIm5iZiI6MTYwMjc4NDU3NywiZXhwIjoxNjAyODcwOTc3LCJpYXQiOjE2MDI3ODQ1Nzd9.9jxr4j-Mq5zBAI5-Ar8QoqnyfPksx6Bs6CZxWJYBIX0';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    }; //'Authorization': 'Bearer $accesstoken',
    String JsonVal =
        json.encode(userDtls); //'{username: "$email", password: "$passwd"}';
    final response = await http.post('http://10.0.2.2:5000/user/save',
        headers: headers, body: JsonVal);
    if (response.statusCode == 200) {
      success = true;
      return success;
    } else {
      print("Registration Error");
      return success;
    }
  }

  Future<String> saveOrderNCheckout(UserVM userOrder) async {
    var token = await storage.read(key: 'Jwt');
    //tokenStore = new FlutterSecureStorage();
    Map<String, String> headers = {"Content-type": "application/json"};
    var jsonValue = json.encode(userOrder.user);
    //new Map.fromIterable(list, key: (v) => v[0], value: (v) => v[1]);;
    final response = await http.post('http://10.0.2.2:5000/Order/save',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonValue);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      //var user = User.fromJson(json);
      //await storage.write(key: 'Jwt', value: json['token']);
      return ""; //user;
    } else {
      throw Exception("Auth Error");
    }
  }

  Future<String> getbusinesshours(String day) async {
    var token = await storage.read(key: 'Jwt');
    //tokenStore = new FlutterSecureStorage();
    Map<String, String> headers = {"Content-type": "application/json"};
    //var jsonValue = json.encode(userOrder.user);
    //new Map.fromIterable(list, key: (v) => v[0], value: (v) => v[1]);;
    final response = await http
        .get('http://10.0.2.2:5000/Outlet/getbusinesshours', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      Iterable bH = json.map((time) => TimeSetter.fromJson(time)).toList().where((element) => element.selectedDay.toLowerCase() == day.toLowerCase());

      //bH = json.map((time) => TimeSetter.fromJson(time)).toString();
      return bH.toString();
    }
  }

  Future<List<Product>> getSubmenu(dynamic catid) async {
    var token = await storage.read(key: 'Jwt');

    final response =
        await http.get('http://10.0.2.2:5000/Product/getall', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((products) => Product.fromJson(products)).toList();
    } else {
      throw Exception("Error downloading MenuItems");
    }
  }

  Future<List<ProductCategory>> getMenuItemsByType(int type) async {
    var token = await storage.read(key: 'Jwt');
    final response =
        await http.get('http://10.0.2.2:5000/ProductCategory/getall', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json
          .map((products) => ProductCategory.fromJson(products))
          .toList()
          .where((element) => element.type == type);
    } else {
      throw Exception("Error downloading MenuItems");
    }
  }
}

/*
{
        "id": 0,
        "outletId": 1,
        "usrId": "08d200c9-d34a-4719-b726-e439ccda6ebc",
        "ordNum": "",
        "firstName": "deepu",
        "lastName": "raghavan",
        "telephone": "9497316930",
        "email": "deepuraghavan@gmail.com",
        "payMode": 2,
        "payStatus": 1,
        "status": 1,
        "total": 0.0,
        "tax": 0.0,
        "discount": 0.0,
        "netTotal": 0.0,
        "date": "2020-08-14T00:00:00",
        "orderDate": "2020-08-14T00:00:00",
        "orderTime": "22:30",
        "items": [
            {
                "id": 0,
                "ordId": 0,
                "prdId": 1,
                "productName": "BURRITO",
                "quantity": 1,
                "price": 17.55,
                "spicyLevel": "High",
                "addInfo": "High",
                 "favorite": 1
            },
            {
                "id": 0,
                "ordId": 0,
                "prdId": 2,
                "productName": "BURRITO BOWEL",
                "quantity": 1,
                "price": 22.0,
                "spicyLevel": "Low",
                "addInfo": "Low",
                "favorite": 1
            }
        ]
    }
 */

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double quantity;
  final double price;
  final String imgloc;
  final String spicyLevel;
  final String typedDescription;
  final String description;

  CartItem(
      {this.id,
      this.title,
      this.quantity,
      this.price,
      this.imgloc,
      this.spicyLevel,
      this.typedDescription,
      this.description});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCountCart {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + (cartItem.price * cartItem.quantity);
    });
    return total;
  }

  double get totalTax {
    var tax = 0.05;
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + (cartItem.price * cartItem.quantity);
    });
    return (total * tax);
  }

  void addItem(String productId, double price, String title, double quantity,
      String imgLoc, String spicyLevel, String typedDescription, String description) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
              imgloc: imgLoc,
              spicyLevel: spicyLevel,
              typedDescription: typedDescription,
          description: existingCartItem.description));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: productId,
              title: title,
              price: price,
              quantity: quantity + 1,
              imgloc: imgLoc,
              spicyLevel: spicyLevel,
              typedDescription: typedDescription,
          description: description));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  //================================ Method to increase quantity in the map ====================================
  void addItemCount(
      String productId,
      double price,
      String title,
      double quantity,
      String imgLoc,
      String spicyLevel,
      String typedDescription,
      String description) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
              imgloc: imgLoc,
              spicyLevel: existingCartItem.spicyLevel,
              typedDescription: existingCartItem.typedDescription,
          description: existingCartItem.description));
    }
    notifyListeners();
  }

  void subtractItemCount(
      String productId,
      double price,
      String title,
      double quantity,
      String imgLoc,
      String spicyLevel,
      String typedDescription,
      String description) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: quantity > 0 ? existingCartItem.quantity - 1 : 0,
              imgloc: imgLoc,
              spicyLevel: existingCartItem.spicyLevel,
              typedDescription: existingCartItem.typedDescription,
          description: existingCartItem.description));
    }
    notifyListeners();
  }

  void printData(){
    items.forEach((key, value) {print('The key is ${key} and the id : ${value.id}, title : ${value.title}, price : ${value.price}, quantity : ${value.quantity}, spicy level : ${value.spicyLevel}, typed Description : ${value.typedDescription}, descritpion : ${value.description}');});
  }

  //this is for toggling favourite icon
  bool isFavourite = false;
  void toggleFavouriteStatus(){
    isFavourite = !isFavourite;
    notifyListeners();
  }

}

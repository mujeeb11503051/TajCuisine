import 'package:flutter/material.dart';

class IndianBread with ChangeNotifier{
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final double quantity;
  final String spicyLevel;
  final String typedDescription;
  final String description;

  IndianBread({this.id, this.title, this.price, this.imageUrl, this.quantity, this.typedDescription,this.spicyLevel, this.description});
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'indian_bread.dart';

class Drinks with ChangeNotifier {
  List<IndianBread> _drinks = [
    IndianBread(
        id: "d1",
        title: "Beer",
        price: 10.0,
        imageUrl: "images/icons8-jam-100.png",
        quantity: 0,
        spicyLevel: " ",
        typedDescription: " ",
    description: " "),
    IndianBread(
        id: "d2",
        title: "Cocktail",
        price: 12.0,
        imageUrl: "images/icons8-jam-100.png",
        quantity: 0,
        spicyLevel: " ",
        typedDescription: " ",
    description: " "),
    IndianBread(
        id: "d3",
        title: "Coconut Cocktail",
        price: 11.0,
        imageUrl: "images/icons8-jam-100.png",
        quantity: 0,
        spicyLevel: " ",
        typedDescription: " ",
    description: " "),
    IndianBread(
        id: "d4",
        title: "Coffee",
        price: 14.0,
        imageUrl: "images/icons8-jam-100.png",
        quantity: 0,
        spicyLevel: " ",
        typedDescription: " ",
    description: " ")
  ];

  List<IndianBread> get drinks {
    return [..._drinks];
  }

  IndianBread findDrinkById(String id) {
    return drinks.firstWhere((element) => element.id == id);
  }
}

import 'package:flutter/material.dart';

import 'indian_bread.dart';

class IndianBreads with ChangeNotifier {
  List<IndianBread> _breads = [
    IndianBread(
        id: "b1",
        catId: "bbb1",
        title: "Lachcha Paratha",
        price: 10.0,
        imageUrl: "images/icons8-strawberry-100.png",
        quantity: 0,
        spicyLevel: " ",
        typedDescription: " ",
    description: " "),
    IndianBread(
        id: "b2",
        catId: "bbb2",
        title: "Roti",
        price: 12.0,
        imageUrl: "images/icons8-sausages-100.png",
        quantity: 0,
        spicyLevel: " ",
        typedDescription: " ",
    description: " "),
    IndianBread(
        id: "b3",
        catId: "bbb3",
        title: "Chapati",
        price: 11.0,
        imageUrl: "images/icons8-raspberry-100.png",
        quantity: 0,
        spicyLevel: " ",
        typedDescription: " ",
    description: " ")
  ];

  List<IndianBread> get breads {
    return [..._breads];
  }

  IndianBread findBreadById(String id) {
    return breads.firstWhere((element) => element.id == id);
  }
}

// here we use the same model(class) for the drinks as well

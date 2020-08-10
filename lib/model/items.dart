import 'package:flutter/material.dart';

class Items {
  final String itemId;
  final String categoryId;
  final String itemName;
  final String itemImage;
  final double itemPrice;
  final String itemDescription;
  final double quantity;
  final String spicyLevel;
  final String typedDescription;
  final bool isFavourite;

  const Items({@required this.itemId,
    @required this.categoryId,
    @required this.itemName,
    @required this.itemImage,
    @required this.itemPrice,
    @required this.itemDescription,
    @required this.quantity,
    this.spicyLevel,
    this.typedDescription,
    this.isFavourite
  }
);
}

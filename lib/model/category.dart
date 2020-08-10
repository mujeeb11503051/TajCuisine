import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String imgLoc;

  const Category({@required this.imgLoc, this.id, @required this.title});
}

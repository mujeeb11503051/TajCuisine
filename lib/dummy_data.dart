import 'package:test_demo22/model/category.dart';
import 'package:flutter/material.dart';
import 'package:test_demo22/model/items.dart';

const DUMMY_CATEGORIES = const [
  Category(id: 'c1', title: 'Apple', imgLoc: 'images/icons8-apple-100.png'),
  Category(
    id: 'c2',
    title: 'Apricot',
    imgLoc: 'images/icons8-apricot-100.png',
  ),
  Category(
    id: 'c3',
    title: 'Blue Berry',
    imgLoc: 'images/icons8-blueberry-100.png',
  ),
  Category(
    id: 'c4',
    title: 'Cherry',
    imgLoc: 'images/icons8-cherry-100.png',
  ),
  Category(
    id: 'c5',
    title: 'Citrus',
    imgLoc: 'images/icons8-citrus-100.png',
  ),
  Category(
    id: 'c6',
    title: 'Jack Fruit',
    imgLoc: 'images/icons8-jackfruit-100.png',
  ),
  Category(
    id: 'c7',
    title: 'Jelly',
    imgLoc: 'images/icons8-jelly-100.png',
  ),
  Category(
    id: 'c8',
    title: 'Dragon Fruit',
    imgLoc: 'images/icons8-dragon-fruit-100.png',
  ),
  Category(
    id: 'c9',
    title: 'Orange',
    imgLoc: 'images/icons8-orange-100.png',
  ),
];

const DUMMY_ITEMS = const [
  Items(
      itemId: '1',
      categoryId: '1',
      itemName: 'Bacon',
      itemPrice: 5,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-bacon-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '2',
      categoryId: 'c2',
      itemName: 'Bagel',
      itemPrice: 12,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-bagel-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '3',
      categoryId: 'c3',
      itemName: 'Banana',
      itemPrice: 11,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-banana-split-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '4',
      categoryId: 'c4',
      itemName: 'Bao Bun',
      itemPrice: 4,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-bao-bun-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '5',
      categoryId: 'c5',
      itemName: 'Bento',
      itemPrice: 9,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-bento-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '6',
      categoryId: 'c6',
      itemName: 'Sandwich',
      itemPrice: 17,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-bitten-sandwich-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '7',
      categoryId: 'c7',
      itemName: 'Brigaderio',
      itemPrice: 14,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-brigadeiro-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '8',
      categoryId: 'c8',
      itemName: 'Cheese',
      itemPrice: 5,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-cheese-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '9',
      categoryId: '1',
      itemName: 'Chocolate Spread',
      itemPrice: 3,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-chocolate-spread-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '10',
      categoryId: '1',
      itemName: 'Coconut',
      itemPrice: 7,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-coconut-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '11',
      categoryId: 'c2',
      itemName: 'Beef',
      itemPrice: 15,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-cuts-of-beef-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '12',
      categoryId: 'c3',
      itemName: 'Pork',
      itemPrice: 25,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-cuts-of-pork-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
  Items(
      itemId: '13',
      categoryId: 'c1',
      itemName: 'Dessert',
      itemPrice: 20,
      itemDescription:
          'In botany, a fruit is the seed-bearing structure in flowering plants formed from the ovary after flowering. ',
      itemImage: 'images/icons8-dessert-100.png',
      quantity: 0,
      spicyLevel: " ",
      typedDescription: " "),
];

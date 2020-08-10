import 'package:flutter/material.dart';
import 'package:test_demo22/pages/product_details.dart';

class ItemCard extends StatelessWidget {
  final String itemCardItemID;
  final String itemCardCatID;
  final String itemCardTitle;
  final String itemCardImgLoc;
  final double itemCardPrice;
  final String itemCardDescription;
  final double itemCardQuantity;
  final String itemCardSpicyLevel;
  final String itemCardTypedDescription;

  ItemCard(
      {this.itemCardItemID,
      this.itemCardCatID,
      this.itemCardTitle,
      this.itemCardImgLoc,
      this.itemCardDescription,
      this.itemCardPrice,
      this.itemCardQuantity,
      this.itemCardSpicyLevel,
      this.itemCardTypedDescription});

  void selectProduct(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ProductDetails.routeName, arguments: {
      'itemCardId': itemCardItemID,
      'itemCardTitle': itemCardTitle,
      'itemCardImgLoc': itemCardImgLoc,
      'itemCardDescription': itemCardDescription,
      'itemCardPrice': itemCardPrice,
      'itemCardQuantity': itemCardQuantity,
      'itemCardSpicyLevel': itemCardSpicyLevel,
      'itemCardTypedDescription': itemCardTypedDescription
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectProduct(context);
      },
      child: Card(
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                height: 120,
                width: 120,
                child: Image.asset(itemCardImgLoc),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  child: Text(
                    itemCardTitle,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

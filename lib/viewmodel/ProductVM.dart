import 'package:flutter/material.dart';
import 'package:test_demo22/model/ProductModel.dart';
import 'package:test_demo22/services/ServiceCalls.dart';

class ProductVM {
  final Product product;
  dynamic iBreads;

  ProductVM({this.product});
  String get name {
    return this.product.name;
  }

  int get id {
    return this.product.id;
  }

  int get catid {
    return this.product.catid;
  }

  int get outid {
    return this.product.outid;
  }

  String get description {
    return this.product.description;
  }

  double get price {
    return this.product.price;
  }

  String get qty {
    return this.product.qty;
  }

  String get image {
    return this.product.image;
  }

  bool get isActive {
    return this.product.isActive;
  }
}

class SubmenuListVM extends ChangeNotifier {
  // final String catid;
  // ProductListVM({this.catid});
  List<ProductVM> productList;

  Future<void> fetchProduct(int catid) async{
    //var id = int.tryParse(catid);
    final submenu = await ServiceCalls().getSubmenu(catid);
    productList = submenu
        .map((products) => ProductVM(product: products))
        .where((element) => element.catid == catid)
        .toList();
    notifyListeners();
  }
  // Future<void> fetchProductByType({int typeID}) async {
  //   //var id = int.tryParse(catid);
  //   final submenu = await ServiceCalls().getSubmenu(typeID);
  //   productList = submenu
  //       .map((products) => ProductVM(product: products))
  //       .where((element) => element. == typeID)
  //       .toList();
  //   notifyListeners();
  // }
}

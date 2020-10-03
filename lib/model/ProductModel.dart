// SELECT `product`.`ID`,
//     `product`.`OUTID`,
//     `product`.`CATID`,
//     `product`.`NAME`,
//     `product`.`DESCRIPTION`,
//     `product`.`PRICE`,
//     `product`.`QTY`,
//     `product`.`IMAGE`,
//     `product`.`ACTIVE`
// FROM `taj-food`.`product`;
class Product {
  int id;
  int outid;
  int catid;
  String name;
  String description;
  double price;
  String qty;
  String image;
  bool isActive;
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        outid: json["outletId"],
        catid: json["categoryId"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        qty: json["quantity"].toString(),
        image: json["image"],
        isActive: json["active"]);
  }
  Product(
      {this.id,
      this.outid,
      this.catid,
      this.name,
      this.description,
      this.price,
      this.qty,
      this.image,
      this.isActive});
}

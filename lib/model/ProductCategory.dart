class ProductCategory {
  int id;
  int outletId;
  int type;
  String name;
  String image;
  bool active;
  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
        id: json["id"],
        outletId: json["outletId"],
        type: json["type"],
        name: json["name"],
        image: json["image"],
        active: json["active"]);
  }
  ProductCategory(
      {this.id, this.outletId, this.type, this.name, this.image, this.active});
}

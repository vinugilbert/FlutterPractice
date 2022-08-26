import 'package:flutter_pratice/database/db_models/product_list_dbmodel.dart';

class ProductList {
  List<Products>? products;

  ProductList({this.products});

  ProductList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      products = <Products>[];
      json['data'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['data'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }



}

class Products {
  String? itemName;
  String? desc;
  int? price;
  String? currency;
  String? expiryDate;
  String? quantity;

  Products(
      {this.itemName,
        this.desc,
        this.price,
        this.currency,
        this.expiryDate,
        this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    itemName = json['item name'];
    desc = json['desc'];
    price = json['price'];
    currency = json['currency'];
    expiryDate = json['expiry date'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item name'] = this.itemName;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['expiry date'] = this.expiryDate;
    data['quantity'] = this.quantity;
    return data;
  }

  Map<String, dynamic> toMap(){
    return {
      ProductListFields.itemName : this.itemName,
      ProductListFields.desc : this.desc,
      ProductListFields.price : this.price,
      ProductListFields.currency : this.currency,
      ProductListFields.expiryDate : this.expiryDate,
      ProductListFields.quantity : this.quantity
    };
  }
}

/*  Products copy({
    int? id,
    String? itemName,
    String? desc,
    int? price,
    String? currency,
    String? expiryDate,
    String? quantity,
  }) =>
      Products(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );*/

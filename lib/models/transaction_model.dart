// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    this.data,
  });

  List<Datum>? data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.itemName,
    this.desc,
    this.price,
    this.currency,
    this.expiryDate,
    this.quantity,
  });

  String? itemName;
  String? desc;
  dynamic price;
  String? currency;
  String? expiryDate;
  String? quantity;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    itemName: json["item name"] == null ? null : json["item name"],
    desc: json["desc"] == null ? null : json["desc"],
    price: json["price"] == null ? null : json["price"],
    currency: json["currency"] == null ? null : json["currency"],
    expiryDate: json["expiry date"] == null ? null : json["expiry date"],
    quantity: json["quantity"] == null ? null : json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "item name": itemName == null ? null : itemName,
    "desc": desc == null ? null : desc,
    "price": price == null ? null : price,
    "currency": currency == null ? null : currency,
    "expiry date": expiryDate == null ? null : expiryDate,
    "quantity": quantity == null ? null : quantity,
  };
}

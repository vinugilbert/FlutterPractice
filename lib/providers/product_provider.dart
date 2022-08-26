import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_pratice/models/transaction_model.dart';
import 'package:flutter_pratice/repository/user_transaction_repository.dart';
import 'package:http/http.dart' as http;

import '../database/product_database.dart';
import '../models/products_list.dart';


class ProductProviders with ChangeNotifier {
  UserTransactionRepository _repository = UserTransactionRepository();

  List<Datum> transactionList = [];

  getUserTransactions() async {
    int? length = await ProductDatatbase.instance.checkifTableEmpty();
    if(transactionList.isNotEmpty) {
      transactionList.clear();
    }
    if(length == 0) {
      var response = await _repository.getUserTransactions();
      if (response != null) {
        var transactionModel = TransactionModel.fromJson(response);
        if(transactionModel.data != null) {
          ProductDatatbase.instance.insertData(transactionModel.data);
          transactionList = transactionModel.data!;
        }
      }
    } else {
      var dbProductsList = await ProductDatatbase.instance.readAllTransactions();
      dbProductsList.forEach((element) {
        Datum datum= Datum();
       datum.itemName=element.itemName;
       datum.quantity=element.quantity;
       datum.expiryDate=element.expiryDate;
       datum.currency=element.currency;
       datum.price=element.price;
       datum.desc=element.desc;
       transactionList.add(datum);
      });

      print("db_Products list size ${transactionList.length}");
    }
    notifyListeners();
  }

void getProducts()
{
  final url=Uri.parse("https://demo9990262.mockable.io/login");
  http.post(url).then((response) =>
      print(json.decode(response.body))
  );
}

Future<void> callWebService()  async{
  List<Products> productList=[];
  /* setState(() {
      isLoading = true;
    });*/
  final url = Uri.parse("https://demo9990262.mockable.io/login");
  var response= await http.post(url);
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var rest = data["data"] as List;
    print(rest.toString());
    productList=rest.map<Products>((json)=>Products.fromJson(json)).toList();
    print(productList.length.toString());
  }
/*    setState(() {
      isLoading = false;
    });*/

}


}
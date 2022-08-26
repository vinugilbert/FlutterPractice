import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_pratice/database/db_models/product_list_dbmodel.dart';
import 'package:flutter_pratice/database/product_database.dart';
import 'package:flutter_pratice/models/products_list.dart';
import 'package:flutter_pratice/providers/product_provider.dart';
import 'package:provider/provider.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  bool _isInit=true;
  @override
  void initState() {
    Provider.of<ProductProviders>(context, listen: false).getUserTransactions();
   // callWebService();
    print("testing");
    // callWebService();
    super.initState();

  }
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();



  }

/*  @override
  void didChangeDependencies() {
if(_isInit)
  {
  Provider.of<ProductProviders>(context).callWebService();
  }
_isInit=false;
super.didChangeDependencies();
  }*/

  var isLoading = false;
  List<Products> productList=[];
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];


  callWebService()  async {
    // setState(() {
    //   isLoading = true;
    // });
    List <Products>  temp_ProductList =[];
    List <DbProducts> db_Products=[];

    int? length=await ProductDatatbase.instance.checkifTableEmpty();
    print("length  " +length.toString());
    if(length==0){
      final url = Uri.parse("https://demo9990262.mockable.io/login");
      var response= await http.post(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data["data"] as List;
        print(rest.toString());
        productList.clear();
        temp_ProductList=rest.map<Products>((json)=>Products.fromJson(json)).toList();
        ProductDatatbase.instance.insertProductList(temp_ProductList);

    }
    }
    else{
      temp_ProductList.clear();
      db_Products=await ProductDatatbase.instance.readAllProducts();
      db_Products.forEach((element) {
        Products products=Products();
        products.desc=element.desc;
        products.price=int.parse(element.price.toString());
        products.currency=element.currency;
        products.expiryDate=element.expiryDate;
        products.quantity=element.quantity;
        products.itemName=element.itemName;
        temp_ProductList.add(products);
      });
      print("db_Products list size " + temp_ProductList.length.toString());
      productList.clear();

    }
    if(mounted) {
      setState(() {
        // isLoading = false;
        productList.addAll(temp_ProductList);
      });
    }

  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProviders>(builder: (context, value, child) {
      return isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                NewTransaction(_addNewTransaction),
                TransactionList(_userTransactions,value.transactionList),
              ],
            );
    },);

    // return Consumer<ProductProviders>(builder: (context, value, child) {
    //   return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: value.transactionList.length,
    //     itemBuilder: (context, index) {
    //       log('Names ${value.transactionList[index].currency}');
    //     return Text(value.transactionList[index].itemName ?? '',  style: TextStyle(color: Colors.blue),);
    //   },);
    // },);
  }
}

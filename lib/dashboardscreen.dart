import 'package:flutter/material.dart';
import 'package:flutter_pratice/widgets/app_drawer.dart';
import 'package:flutter_pratice/widgets/simple_map_screen.dart';
import 'dart:convert';


import 'package:http/http.dart' as http;
import 'widgets/user_transactions.dart';

class DashBoardScreen extends StatelessWidget{
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();


  void _goToCart(BuildContext ctx,String text) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: (Colors.black12),
      action: SnackBarAction(
        label: 'dismiss',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
          actions: <Widget>[
      IconButton(
      icon: Icon(Icons.shopping_cart),
     onPressed: () => _goToCart(context,"Navigate To Cart Page")
    ),
    ]
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          /*  Container(
              width: double.infinity,
              height: 30,
              child: Card(
                color: Colors.blue,
                child: Text('Item llll'),
                elevation: 5,
              ),
            ),*/
            UserTransactions(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: ()
        {
          Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)
          {
            return const SimpleMapScreen();
          }));
        },
      ),
    );
  }
}
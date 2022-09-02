import 'package:flutter/material.dart';
import 'package:flutter_pratice/models/products_list.dart';
import 'package:flutter_pratice/models/transaction_model.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final List<Datum> products;


  TransactionList(this.transactions,this.products);

  @override
  _TransactionListState createState() => _TransactionListState();
}
class _TransactionListState extends State<TransactionList> {
 // bool? isChecked = false;
  static int _len = 6;
  List<bool> isChecked = List.generate(_len, (index) => false);

  @override
  Widget build(BuildContext context) {

    //final List<Datum> products;

    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${widget.products[index].price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.products[index].itemName.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      (widget.products[index].expiryDate.toString()),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                Checkbox(
                  value: isChecked[index],
                  autofocus: false,
                  activeColor: Colors.deepPurple,
                  checkColor: Colors.white,
                  onChanged:(value)
                  {
                    setState(() {
                      isChecked[index]=value!;
                    });
                  },
                )
              ],
            ),
          );
        },
        itemCount: widget.products.length,
      ),
    );
  }
}

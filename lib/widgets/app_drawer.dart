import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(
      children: <Widget>[
        AppBar(
          title: Text("ListPage"),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(leading: Icon(Icons.add_shopping_cart),title: Text('Orders'),),
        Divider(),
        ListTile(leading: Icon(Icons.message),title: Text('Messages'),),
        Divider(),
        ListTile(leading: Icon(Icons.camera),title: Text('Camera'),),

      ],
    ),
    );
  }

}
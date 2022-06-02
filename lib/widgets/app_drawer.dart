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
        ListTile(leading: Icon(Icons.camera),title: Text('Camera'),),
        Divider(),
        ListTile(leading: Icon(Icons.camera),title: Text('Camera'),),
        Divider(),
        ListTile(leading: Icon(Icons.camera),title: Text('Camera'),),

      ],
    ),
    );
  }

}
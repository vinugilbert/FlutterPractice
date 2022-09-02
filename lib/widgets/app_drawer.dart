import 'package:flutter/material.dart';
import 'package:flutter_pratice/shared_pref/user_preference.dart';
import 'package:flutter_pratice/widgets/user_page.dart';

class AppDrawer extends StatelessWidget
{
  //final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {

    final name = UserPreference.getUserName();
    final email = UserPreference.getUserEmail();
    final urlImage =
        'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

    return Drawer(child: ListView(

       /* AppBar(
          title: Text("ListPage"),
          automaticallyImplyLeading: false,
        ),*/
      // Remove padding
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("$name"),
          accountEmail: Text('$email'),
          onDetailsPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserPage(
              name: '$name',
              urlImage: urlImage,
            ),
          )),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
            ),
          ),
        ),
        ListTile(leading: Icon(Icons.add_shopping_cart),title: Text('Orders'),),
        Divider(),
        ListTile(leading: Icon(Icons.message),title: Text('Messages'),),
        Divider(),
        ListTile(leading: Icon(Icons.camera),title: Text('Camera'),),

      ],
    ),
    );
  }
/*  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );*/

}
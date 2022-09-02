import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pratice/shared_pref/user_preference.dart';
import 'package:flutter_pratice/widgets/button_widget.dart';
import 'package:flutter_pratice/widgets/edit_profile_page.dart';
import 'package:flutter_pratice/widgets/numbers_widget.dart';
import 'package:flutter_pratice/widgets/profile_widget.dart';

class UserPage extends StatefulWidget {
  final String name;
  final String urlImage;
  var userName = UserPreference.getUserName();
  var userEmail = UserPreference.getUserEmail();

  @override
  _UserPageState createState() => _UserPageState();

  UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.deepPurple, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: widget.urlImage,
            onClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
              setState(() {});
            },
          ),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(),
        ],
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            "${widget.userName}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            "${widget.userEmail}",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
                'The analyzer produces this diagnostic when it finds an assignment to a top-level variable, a static field, or a local variable that has the const modifier. The value of a compile-time constant can’t be changed at runtime.',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

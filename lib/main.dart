import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_pratice/dashboardscreen.dart';
import 'package:flutter_pratice/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Practice App';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProviders(),),
      ],
      child: MaterialApp(
        title: _title,
        home: Scaffold(
          appBar: AppBar(title: const Text(_title)),
          body: const MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isValid=false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  String passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  bool _checkTextFieldValidation(BuildContext context) {
    String useremail, password;
    bool isValid= false;
    useremail = emailController.text;
    password = passwordController.text;
    if (useremail == '' || password == '') {
      _showSnackBar(context, 'Fields are empty');
      isValid=false;
    } else {
      if (useremail != '' && !RegExp(emailPattern).hasMatch(useremail)) {
        isValid=false;
        _showSnackBar(context, 'Enter Valid email Address');
      } else {
        if (password != '' && !RegExp(passwordPattern).hasMatch(password)) {
          isValid=false;
          _showSnackBar(context, 'Enter Valid Password');
        }
        else{
          _showSnackBar(context, 'All Good');
          isValid=true;
        }
      }
    }
    return isValid;
  }

  _showSnackBar(BuildContext context, String validationInfo) {
    final snackBar = SnackBar(
      content: Text(validationInfo),
      backgroundColor: (Colors.black12),
      action: SnackBarAction(
        label: 'dismiss',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Flutter Learning',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    isValid=true;
                    if(isValid)
                     {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardScreen()));
                      }
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}

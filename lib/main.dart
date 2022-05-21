import 'package:flutter/material.dart';
import 'package:flutter_scanner2/screens/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accinvent pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigo.shade900,
      ),
      home: LoginPage(),
    );
  }
}




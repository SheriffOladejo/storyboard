import 'package:flutter/material.dart';
import 'package:storyboard/views/welcome_page.dart';

void main() {
  runApp(MyApp());
}

// This is the root of the application with the WelcomePage
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage()
    );
  }
}


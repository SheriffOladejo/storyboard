import 'dart:async';

import 'package:flutter/material.dart';
import 'package:storyboard/hex_color.dart';
import 'package:storyboard/views/sign_in.dart';

class WelcomePage extends StatefulWidget {

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => SignIn())));
    return Scaffold(
      backgroundColor: HexColor("#72C7E4"),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset("assets/images/welcome_page.png"),
      ),
    );
  }

}

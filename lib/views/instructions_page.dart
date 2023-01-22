import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyboard/hex_color.dart';
import 'package:storyboard/views/home_page.dart';

class InstructionsPage extends StatefulWidget {

  @override
  State<InstructionsPage> createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ffffff"),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.fromLTRB(15,20, 15, 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/instructions_page.png"),
            fit: BoxFit.cover,
          ),
          color: HexColor("#72C7E4")
        ),
        child: Column(
          children: [
            Container(height: 20,),
            Row(
              children: [
                Container(width: 20,),
                Image.asset("assets/images/moon.png", width: 60, height: 75,),
                Container(width: 15,),
                const Text("Welcome to\nSTORYTALE", style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'hobo',
                    fontSize: 24,
                    fontWeight: FontWeight.normal),
                )
              ],
            ),
            Container(height: 60,),
            Text("Firstly: To use this application you should sign up and register", style: TextStyle(
                fontFamily: 'hobo',
                color: HexColor("#326677"),
                fontSize: 14
            ),),
            Container(height: 40,),
            Text("Secondly: Once you created an account for you, you can start using all the features", style: TextStyle(
                fontFamily: 'hobo',
                color: HexColor("#326677"),
                fontSize: 14
            ),),
            Container(height: 40,),
            Text("Thirdly: There are 3 main features in this app that you will use:\n\n"
                "1. Create story: You can use it to create whatever story you want for your kids.\n\n"
                "2. Books & Stories: You can use it to read different stories for your kids.\n\n"
                "3. Saved stories: You can view stories that you have created using Create Story feature.", style: TextStyle(
                fontFamily: 'hobo',
                color: HexColor("#326677"),
                fontSize: 14
            ),),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
              child: Row(
                children: [
                  Text("Return to Homepage", style: TextStyle(
                      fontFamily: 'hobo',
                      color: HexColor("#326677"),
                      fontSize: 14
                  ),),
                  Icon(CupertinoIcons.chevron_right, size: 24, color: HexColor("#326677"),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

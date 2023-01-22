import 'package:flutter/material.dart';
import 'package:storyboard/hex_color.dart';
import 'package:storyboard/views/create_story.dart';
import 'package:storyboard/views/instructions_page.dart';
import 'package:storyboard/views/sign_in.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // This variable controls whether to show the option menu
  bool showMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ffffff"),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.fromLTRB(15,20,15,20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/main_page.png"),
            fit: BoxFit.cover,
          ),
          color: HexColor("#72C7E4")
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(height: 20,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          showMenu = true;
                        });
                      },
                      child: const Padding(padding: EdgeInsets.all(10),child: Icon(Icons.menu, color: Colors.white, size: 24,))
                    ),
                    Container(width: 50,),
                    const Text("STORYTALE", style: TextStyle(fontSize: 30, fontFamily: 'hobo', color: Colors.white)),
                  ],
                ),
                Container(height: 350,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => CreateStory()));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: HexColor("#72C7E4")
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/pencil.png",
                            width: 24,
                            height: 24,
                          ),
                          Text("Create New", style: TextStyle(fontFamily: 'hobo', fontSize: 10, color: HexColor("#326677")),)
                        ],
                      )
                  ),
                )
              ],
            ),
            showMenu ? Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              height: 90,
              width: 165,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: HexColor("#B5E2F1")
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/images/menu_icon1.png"),
                            Container(width: 5,),
                            Text("Sign In/Up", style: TextStyle(fontSize: 14, color: HexColor("#326677"), fontFamily: 'hobo'),),
                            Container(width: 10,),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            showMenu = false;
                          });
                        },
                        child: Padding(padding: const EdgeInsets.all(10),child: Icon(Icons.close, size: 20, color: HexColor("#326677"),)),
                      ),
                    ],
                  ),
                  Container(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InstructionsPage()));
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/menu_icon2.png"),
                        Container(width: 5,),
                        Text("Instructions", style: TextStyle(fontSize: 14, color: HexColor("#326677"), fontFamily: 'hobo'),)
                      ],
                    ),
                  )
                ],
              ),
            ) : Container(),
          ],
        )

      ),
    );
  }
}

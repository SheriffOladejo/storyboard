import 'package:flutter/material.dart';
import 'package:storyboard/hex_color.dart';
import 'package:storyboard/views/instructions_page.dart';

class SignIn extends StatefulWidget {

  @override
  State<SignIn> createState() => _SignInState();

}

class _SignInState extends State<SignIn> {

  // This variable controls what the screen shows when the user
  // clicks on the Sign In or Sign Up tabs
  bool showSignInPage = true;

  // This variable keeps the user signed in
  bool keepMeSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#72C7E4"),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(left: 15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              Container(
                alignment: Alignment.centerRight,
                child: Image.asset("assets/images/home.png", width: 195, height: 140,)
              ),
              Container(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height - 245,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))
                ),
                padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  showSignInPage = !showSignInPage;
                                });
                              },
                              child: Text("Sign in", style: TextStyle(
                                  fontFamily: 'hobo',
                                  color: showSignInPage ? HexColor("#326677") : Colors.grey,
                                  fontSize: 18
                              ),),
                            ),
                            showSignInPage ? Container(
                              width: 50,
                              height: 2,
                              color: HexColor("72C7E4"),
                            ) : Container()
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  showSignInPage = !showSignInPage;
                                });
                              },
                              child: Text("Sign up", style: TextStyle(
                                  fontFamily: 'hobo',
                                  color: !showSignInPage ? HexColor("#326677") : Colors.grey,
                                  fontSize: 18,
                              ),),
                            ),
                            !showSignInPage ? Container(
                              width: 50,
                              height: 2,
                              color: HexColor("72C7E4"),
                            ) : Container()
                          ],
                        ),
                      ],
                    ),
                    Container(height: 60,),
                    TextField(
                      style: TextStyle(fontSize: 14,color: HexColor("#326677")),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#72C7E4')),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#72C7E4')),
                        ),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: HexColor('#72C7E4')),
                      ),
                    ),
                    Container(height: 20,),
                    showSignInPage ? Container() : TextField(
                      obscureText: false,
                      style: TextStyle(fontSize: 14,color: HexColor("#326677")),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#72C7E4')),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#72C7E4')),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: HexColor('#72C7E4')),
                      ),
                    ),
                    showSignInPage ? Container() : Container(height: 20,),
                    TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 14,color: HexColor("#326677")),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#72C7E4')),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#72C7E4')),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: HexColor('#72C7E4')),
                      ),
                    ),
                    Container(height: 10,),
                    showSignInPage ? Row(
                      children: [
                        Checkbox(
                          value: keepMeSignedIn,
                          onChanged: (newValue) {
                            setState(() {
                              keepMeSignedIn = newValue;
                            });
                          },),
                        Text("Keep me signed in", style: TextStyle(
                            fontFamily: 'hobo',
                            color: HexColor("#326677"),
                            fontSize: 9
                        )),
                      ],
                    ) : Container(),
                    Container(height: 15,),
                    GestureDetector(
                      onTap: (){
                        if(showSignInPage){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InstructionsPage()));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: HexColor('#72C7E4'),
                          borderRadius: const BorderRadius.all(Radius.circular(30))
                        ),
                        child: Text(showSignInPage ? "Sign in" : "Sign up", style: TextStyle(
                            fontFamily: 'hobo',
                            color: HexColor("#326677"),
                            fontSize: 12
                        )),
                      ),
                    ),
                    Container(height: 40,),
                    showSignInPage ?  Text("Forgot password?", style: TextStyle(
                        fontFamily: 'hobo',
                        color: HexColor("#326677"),
                        fontSize: 9
                    )) : GestureDetector(
                      onTap: (){
                        setState(() {
                          showSignInPage = !showSignInPage;
                        });
                      },
                      child: Text("I am already a member", style: TextStyle(
                          fontFamily: 'hobo',
                          color: HexColor("#326677"),
                          fontSize: 9
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

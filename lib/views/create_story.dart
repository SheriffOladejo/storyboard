import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyboard/hex_color.dart';
import 'package:storyboard/views/home_page.dart';
import 'package:storyboard/views/instructions_page.dart';
import 'package:storyboard/views/sign_in.dart';

class CreateStory extends StatefulWidget {

  @override
  State<CreateStory> createState() => _CreateStoryState();

}

class _CreateStoryState extends State<CreateStory> {

  // This variable controls whether to show the option menu
  bool showMenu = false;

  List<GestureDetector> list  = [];
  List<Widget> story_list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ffffff"),
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: const EdgeInsets.fromLTRB(15,20,15,20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_background2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(height: 10,),
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
                      Image.asset("assets/images/wizard.png", width: 65, height: 65,)
                    ],
                  ),
                  Container(
                    height: 430,
                    width: 315,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                      border: Border.all(color: HexColor("#72C7E4"))
                    ),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: story_list,
                        ),
                      ),
                    ),
                  ),
                  Container(height: 60,),
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 60,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      color: HexColor("#72C7E4")
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            leftShift(list);
                          },
                          child: Padding(padding: const EdgeInsets.all(10),child: Icon(CupertinoIcons.chevron_left, color: HexColor("#326677"),))
                        ),
                        list[0],
                        list[1],
                        list[2],
                        GestureDetector(
                          onTap: (){
                            rightShift(list);
                          },
                          child: Padding(padding: const EdgeInsets.all(10),child: Icon(CupertinoIcons.chevron_right, color: HexColor("#326677"),))
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));
                          },
                          child: Icon(Icons.home, color: HexColor("#326677"))
                        ),
                        GestureDetector(
                            onTap: (){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Story has been saved"),
                              ));
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (BuildContext context) => HomePage()));
                            },
                          child: Row(
                            children: [
                              Text("Finish", style: TextStyle(fontSize: 12, fontFamily: 'hobo', color: HexColor("#326677"))),
                              Icon(CupertinoIcons.chevron_right, color: HexColor("#326677"))
                            ],
                          )
                        )
                      ],
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

  void callback(){
    setState(() {

    });
  }

  void init(){
    GestureDetector text = GestureDetector(
      child: Image.asset("assets/images/text.png"),
      onTap: (){
        //showTextDialog
        AlertDialog alert = AlertDialog(
          content: WriteTextDialog(callback: callback, story_list: story_list,),
        );
        // show the dialog
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      },
    );
    GestureDetector microphone = GestureDetector(
      child: Image.asset("assets/images/microphone.png"),
      onTap: (){
        //showMicrophoneDialog
        story_list.add(Container(height: 20,));
        story_list.add(Image.asset("assets/images/record.png"));
        setState(() {

        });
      },
    );
    GestureDetector music = GestureDetector(
      child: Image.asset("assets/images/music.png"),
      onTap: (){
        //showMusicDialog
        AlertDialog alert = AlertDialog(
          content: SelectMusicDialog(callback: callback, story_list: story_list,),
        );
        // show the dialog
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      },
    );
    GestureDetector sound_effect = GestureDetector(
      child: Image.asset("assets/images/sound_effect.png"),
      onTap: (){
        //showMusicDialog
        AlertDialog alert = AlertDialog(
          content: SelectSoundEffectDialog(callback: callback, story_list: story_list,),
        );
        // show the dialog
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      },
    );
    GestureDetector palette = GestureDetector(
      child: Image.asset("assets/images/palette.png"),
      onTap: (){
        //showImagesDialog
        AlertDialog alert = AlertDialog(
          content: SelectImageDialog(callback: callback, story_list: story_list,),
        );
        // show the dialog
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      },
    );
    GestureDetector animations = GestureDetector(
      child: Image.asset("assets/images/animations.png"),
      onTap: (){
        //showAnimationDialog
        AlertDialog alert = AlertDialog(
          content: SelectGIFDialog(callback: callback, story_list: story_list,),
        );
        // show the dialog
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      },
    );
    list  = [text, microphone, music, palette, animations, sound_effect];
  }

  @override
  void initState(){
    super.initState();
    init();
  }

  void leftShift(List<dynamic> list){
    GestureDetector firstElement = list[0];
    for(var i = 1; i < list.length; i++){
      list[i- 1] = list[i];
    }
    list[list.length - 1] = firstElement;
    setState(() {

    });
  }

  void rightShift(List<dynamic> list){
    GestureDetector lastElement = list[list.length - 1];
    for(var i = list.length - 2; i >= 0; i--){
      list[i+1] = list[i];
    }
    list[0] = lastElement;
    setState(() {

    });
  }

}

class SelectImageDialog extends StatefulWidget {

  List<Widget> story_list;
  Function callback;
  SelectImageDialog({this.story_list, this.callback});

  @override
  State<SelectImageDialog> createState() => _SelectImageDialogState();
}

class _SelectImageDialogState extends State<SelectImageDialog> {

  List<Widget> images = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.maxFinite,
      child: ListView(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 6,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: images,
          ),
        ],
      ),
    );
  }

  void init(){
    for(int i = 1; i <= 37; i++){
      images.add(
          GestureDetector(
              onTap: (){
                widget.story_list.add(Image.asset("assets/images/image${i.toString()}.png", fit: BoxFit.contain, width: 300, height: 50,));
                widget.callback();
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/image${i.toString()}.png", fit: BoxFit.contain, width: 30, height: 30,)
          )
      );
    }
  }

  @override
  void initState(){
    super.initState();
    init();
  }

}

class WriteTextDialog extends StatefulWidget {

  List<Widget> story_list;
  Function callback;
  WriteTextDialog({this.story_list, this.callback});

  @override
  State<WriteTextDialog> createState() => _WriteTextDialogState();

}

class _WriteTextDialogState extends State<WriteTextDialog> {

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          TextField(
            controller: controller,
            obscureText: false,
            style: TextStyle(fontSize: 14,color: HexColor("#326677")),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor('#72C7E4')),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor('#72C7E4')),
              ),
              hintText: 'Text',
              hintStyle: TextStyle(color: HexColor('#72C7E4')),
            ),
          ),
          Container(height: 35,),
          GestureDetector(
            onTap: (){
              if(controller.text.toString().isNotEmpty){
                widget.story_list.add(
                  Text(controller.text.toString(),
                      style: TextStyle(
                      fontFamily: 'hobo',
                      color: HexColor("#326677"),
                      fontSize: 14
                  ))
                );
              }
              widget.callback();
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: HexColor('#72C7E4'),
                  borderRadius: const BorderRadius.all(Radius.circular(30))
              ),
              child: Text("Okay", style: TextStyle(
                  fontFamily: 'hobo',
                  color: HexColor("#326677"),
                  fontSize: 12
              )),
            ),
          )
        ],
      ),
    );
  }

}

class SelectMusicDialog extends StatefulWidget {

  List<Widget> story_list;
  Function callback;
  SelectMusicDialog({this.story_list, this.callback});

  @override
  State<SelectMusicDialog> createState() => _SelectMusicDialogState();

}

class _SelectMusicDialogState extends State<SelectMusicDialog> {

  List<Widget> music = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        controller: ScrollController(),
        itemCount: music.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index){
          Widget widget = music[index];
          return widget;
        },
      ),
    );
  }

  void init(){
    for(int i = 1; i <= 10; i++){
      music.add(
          GestureDetector(
            onTap: (){
              widget.story_list.add(Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor("#326677")),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.music_note, color: HexColor("#326677"),),
                      Container(width: 100,),
                      Text(
                        "Music ${i.toString()}",
                        style: TextStyle(fontSize: 14,color: HexColor("#326677")),
                      ),
                    ],
                  )
              ));
              widget.callback();
              Navigator.pop(context);
            },
            child: Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: HexColor("#326677")),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.music_note, color: HexColor("#326677"),),
                    const Spacer(),
                    Text(
                      "Music ${i.toString()}",
                      style: TextStyle(fontSize: 14,color: HexColor("#326677")),
                    ),
                  ],
                )
            ),
          )
      );
    }
  }

  @override
  void initState(){
    super.initState();
    init();
  }

}

class SelectSoundEffectDialog extends StatefulWidget {

  List<Widget> story_list;
  Function callback;
  SelectSoundEffectDialog({this.story_list, this.callback});

  @override
  State<SelectSoundEffectDialog> createState() => _SelectSoundEffectDialogState();
}

class _SelectSoundEffectDialogState extends State<SelectSoundEffectDialog> {
  List<Widget> track_list = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        controller: ScrollController(),
        itemCount: track_list.length,
        shrinkWrap: false,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index){
          Widget widget = track_list[index];
          return widget;
        },
      ),
    );
  }

  void init(){
    for(int i = 1; i <= 10; i++){
      track_list.add(
          GestureDetector(
            onTap: (){
              widget.story_list.add(Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor("#326677")),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.music_note, color: HexColor("#326677"),),
                      Container(width: 100,),
                      Text(
                        "Sound effect ${i.toString()}",
                        style: TextStyle(fontSize: 14,color: HexColor("#326677")),
                      ),
                    ],
                  )
              ));
              widget.callback();
              Navigator.pop(context);
            },
            child: Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: HexColor("#326677")),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.music_note, color: HexColor("#326677"),),
                    const Spacer(),
                    Text(
                      "Sound effect ${i.toString()}",
                      style: TextStyle(fontSize: 14,color: HexColor("#326677")),
                    ),
                  ],
                )
            ),
          )
      );
    }
  }

  @override
  void initState(){
    super.initState();
    init();
  }
}

class SelectGIFDialog extends StatefulWidget {

  List<Widget> story_list;
  Function callback;
  SelectGIFDialog({this.story_list, this.callback});

  @override
  State<SelectGIFDialog> createState() => _SelectGIFDialogState();

}

class _SelectGIFDialogState extends State<SelectGIFDialog> {
  List<Widget> gifs = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.maxFinite,
      child: ListView(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: gifs,
          ),
        ],
      ),
    );
  }

  void init(){
    for(int i = 1; i <= 4; i++){
      gifs.add(
          GestureDetector(
              onTap: (){
                widget.story_list.add(Image.asset("assets/images/gif${i.toString()}.gif", fit: BoxFit.contain, width: 300, height: 50,));
                widget.callback();
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/gif${i.toString()}.gif", fit: BoxFit.contain, width: 300, height: 30,)
          )
      );
    }
  }

  @override
  void initState(){
    super.initState();
    init();
  }
}






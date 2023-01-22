import 'package:flutter/material.dart';

class ImageAdapter extends StatefulWidget {

  String image;
  BuildContext context;
  ImageAdapter({this.image, this.context});

  @override
  State<ImageAdapter> createState() => _ImageAdapterState();
}

class _ImageAdapterState extends State<ImageAdapter> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(widget.context, image);
      },
      child: image()
    );
  }

  Widget image(){
    return Image.asset(widget.image, width: 30, height: 30,);
  }

}

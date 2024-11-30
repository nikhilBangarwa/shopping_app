import 'package:flutter/material.dart';

class WebSpot extends StatefulWidget {

  Widget mobile;
  Widget web;
  Widget deskBoard;
   WebSpot({super.key,required this.mobile,required this.web,required this.deskBoard});

  @override
  State<WebSpot> createState() => _WebSpotState();
}

class _WebSpotState extends State<WebSpot> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,index){
      if(index.maxWidth<700){
        return widget.mobile;
      } else if(index.maxWidth<1100){
        return widget.web;
      } return widget.deskBoard;
    });
  }
}

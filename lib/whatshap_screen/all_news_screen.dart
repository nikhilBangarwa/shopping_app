import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' News Details',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),),
    );
  }
}

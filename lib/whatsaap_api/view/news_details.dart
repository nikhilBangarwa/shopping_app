import 'package:flutter/material.dart';
import 'package:shopping_app/whatsaap_api/service/model_screen.dart';

class NewsDetails extends StatefulWidget {
   NewsDetails({super.key,required this.articles});
  Articles articles;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Column(
       children: [
         Image.network(widget.articles.urlToImage??''),
         const SizedBox(height: 6,),
         Text(widget.articles.description??"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
       ],
         ),
      ),
    );
  }
}

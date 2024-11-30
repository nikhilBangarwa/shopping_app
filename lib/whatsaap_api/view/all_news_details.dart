import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/whatsaap_api/provider/news_provider.dart';
import 'package:shopping_app/whatsaap_api/view/all_news_details.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key});

  @override
  State<NewsDetailsScreen>
     createState() => _NewDetailsScreenState();
}

class _NewDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData()async{
    NewsProvider newsProvider=Provider.of<NewsProvider>(context,listen: false);
     await newsProvider.fetchProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Details Screen'),),
      body: Consumer<NewsProvider>(builder: (context,provider,child){
        return ListView.separated(
            itemBuilder: (context,index){
          final product=provider.articleList[index];
          return ListTile(
           title: Text(product.title??""),
            trailing: Container(
              height: 80,
              width: 60,
              child: Image.network(product.urlToImage??''),
            ),
          );
        }, separatorBuilder: (context,index){
          return Divider();
        }, itemCount: provider.articleList.length);
      }),
    );
  }
}

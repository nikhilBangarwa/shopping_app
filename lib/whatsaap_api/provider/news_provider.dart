import 'package:flutter/cupertino.dart';
import 'package:shopping_app/whatsaap_api/service/model_screen.dart';

import 'package:shopping_app/whatsaap_api/service/news_service.dart';

class NewsProvider extends ChangeNotifier{
  NewsProvider(this.newsService);

  NewsService newsService;
  List<Articles> articleList=[];
 Future fetchProduct()async{
  try{
    articleList=await newsService.fetchData();
    notifyListeners();
  }catch(e){
    print(e.toString());
  }
 }


}
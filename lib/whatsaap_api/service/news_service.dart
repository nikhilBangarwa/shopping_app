
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/whatsaap_api/service/model_screen.dart';
class NewsService{
  Future<List<Articles>> fetchData()async{
    String url='https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ab100bc7ed42496f9fada389187c230e';
    Uri uri=Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode==200){
      String str= response.body;
      final json=jsonDecode(str);
      NewsModel newsModel=NewsModel.fromJson(json);
      return newsModel.articles??[];
    }else{
      print('Your data is save');
      return [];
    }

  }
}
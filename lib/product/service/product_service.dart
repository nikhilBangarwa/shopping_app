import 'dart:convert';

import 'package:shopping_app/api_data/api_url_screen.dart';
import 'package:http/http.dart'as http;
import 'package:shopping_app/product/model/product_modle.dart';
import 'package:shopping_app/product/model/products_model.dart';


class ProductService{
   Future<List<Products>> get()async{
   String url=ApiData.baseUrl;
   Uri uri=Uri.parse(url);
   final response=await http.get(uri);
   if(response.statusCode==200){
     String string=response.body;
     final json=jsonDecode(string);
     Product product =Product.fromJson(json);
     return product.products??[];
   }else{
     throw "Something went wrong";
   }

 }
 Future<bool>saveProduct(Products products)async{
 String url=ApiData.baseUrl;
  String json=jsonEncode(products.toJson());
     final response =await http.post(Uri.parse(url),body: json);
 if(response.statusCode==200){
   return true;
 }else{
 throw 'something went wrong';
 }
 }
 Future<bool> deleteProduct(int id)async{
     String url="${ApiData.deleteUrl}$id";
     final response= await http.delete(Uri.parse(url));
     if(response.statusCode==200){
      return true;
     }else{
       throw 'your data is not save';
     }
 }

}
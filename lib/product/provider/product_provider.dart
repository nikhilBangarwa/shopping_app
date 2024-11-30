
import 'package:flutter/foundation.dart';
import 'package:shopping_app/app_util_screen.dart';
import 'package:shopping_app/product/model/products_model.dart';
import 'package:shopping_app/product/service/product_service.dart';

class ProductProvider extends ChangeNotifier{
  List<Products>  productList=[];
  ProductProvider(this.productService);
  ProductService productService;



  Future fetchValue()async{
  try{
    productList=   await productService.get();
    notifyListeners();
  }catch(e){
    if (kDebugMode) {
      print("Some Thing went wrong");
    }
  }
  }
  Future saveProduct(Products product)async{
    try {
      bool productList = await productService.saveProduct(product);
      if(productList){
        AppUtil.showToasts('Your product is successfully');
      }
    }catch(e){
      AppUtil.showToasts(e.toString());
    }
  }
  Future deleteProduct(int id)async{
    try{
   bool delete= await productService.deleteProduct(id);
   if(delete) {
  AppUtil.showToasts('your product is delete');
   }
   }catch(e){
      AppUtil.showToasts(e.toString());
    }
   }


}
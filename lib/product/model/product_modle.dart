import 'package:shopping_app/product/model/products_model.dart';

class Product{
List<Products>? products;
int? total;
int? skip;
int? limit;

Product({this.products, this.total, this.skip, this.limit});

Product.fromJson(Map<String, dynamic> json) {
if (json['products'] != null) {
products = <Products>[];
json['products'].forEach((v) { products!.add( Products.fromJson(v)); });
}
total = json['total'];
skip = json['skip'];
limit = json['limit'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
if (products != null) {
data['products'] = products!.map((v) => v.toJson()).toList();
}
data['total'] = total;
data['skip'] = skip;
data['limit'] = limit;
return data;
}
}








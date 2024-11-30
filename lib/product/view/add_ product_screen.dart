import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/product/model/products_model.dart';
import 'package:shopping_app/product/provider/product_provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final titleController=TextEditingController();
  final imageController=TextEditingController();
  final priceController=TextEditingController();
final GlobalKey key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("data"),),
body: getBody(),    );
  }
  Widget getBody(){
    return Form(
      key: key,
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                labelText: 'Enter title',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            controller: imageController,
            decoration: InputDecoration(
                labelText: 'Enter Image',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),

          ),
          const SizedBox(height: 16,),
          TextFormField(
            controller: priceController,
            decoration: InputDecoration(
                labelText: 'Enter Image',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          const SizedBox(height: 16,),
          ElevatedButton(onPressed: getValue, child: const Text("Add Product"))
        ],
      ),
    );
  }
  void getValue(){
    String title=titleController.text;
    String image=imageController.text;
    double prices=double.tryParse(priceController.text)??0;

   Products product=Products(
     title: title,
       images:[image],
     price: prices,

   );
    ProductProvider productProvider=Provider.of<ProductProvider>(context,listen: false);
    productProvider.saveProduct(product);
   Navigator.pop(context);


  }

}

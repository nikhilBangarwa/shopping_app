import 'package:flutter/material.dart';

class ProductOderDetailScreen extends StatefulWidget {
  final String name;
  final String city;
  final String pinCode;
  final String address;

  ProductOderDetailScreen(
      {super.key,
      required this.name,
      required this.city,
      required this.pinCode,
      required this.address});

  @override
  State<ProductOderDetailScreen> createState() =>
      _ProductOderDetailScreenState();
}

class _ProductOderDetailScreenState extends State<ProductOderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Oder Summary',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Deliver to:',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.black45)
                    ),
                    child:  TextButton(onPressed: (){}, child: const Text('Change',style: TextStyle(fontSize: 15,color: Colors.blue)))
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Text(widget.name,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),),
            const SizedBox(height: 7,),
             Text(widget.city,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black),)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_app/commen_screen/store_data_screen.dart';

class ProdectScrren extends StatefulWidget {
  const ProdectScrren({super.key});

  @override
  State<ProdectScrren> createState() => _ProdectScrrenState();
}

class _ProdectScrrenState extends State<ProdectScrren> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prodect Screen'),),
    );
  }
}

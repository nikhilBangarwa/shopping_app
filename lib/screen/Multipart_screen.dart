
import 'package:flutter/material.dart';
import 'package:shopping_app/expoler_screen/product_slider_screen.dart';
import 'package:shopping_app/home_screen/home_screen.dart';

import 'package:shopping_app/screen/setting_screen.dart';

class MultipartScreen extends StatefulWidget {
  const MultipartScreen({super.key});

  @override
  State<MultipartScreen> createState() => _MultipartState();
}

class _MultipartState extends State<MultipartScreen> {
  int index=0;
  List image=[
    const HomeScreen(),
    const ProductSliderScreen(),
     const SettingScreen(),
     const SettingScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore),label: 'explore '),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: 'category '),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'setting '),
      ],currentIndex: index,
          type: BottomNavigationBarType.fixed,
         selectedItemColor: Colors.blue,
        onTap: (value){
        setState(() {
          index=value;
        });
        },
      ),
      body: image[index],
    );
  }
}

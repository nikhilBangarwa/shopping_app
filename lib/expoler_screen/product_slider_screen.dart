import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/expoler_screen/Explore_product2_screen.dart';
import 'package:shopping_app/expoler_screen/explore_product1_screen.dart';
import 'package:shopping_app/expoler_screen/explore_screen.dart';

class ProductSliderScreen extends StatefulWidget {
  const ProductSliderScreen({super.key});

  @override
  State<ProductSliderScreen> createState() => _ProductSliderScreenState();
}

class _ProductSliderScreenState extends State<ProductSliderScreen> {
  int index = 0;
  final PageController controller = PageController();
  List<Widget> list=[
    const ExploreScreen(),
    const ProductExplore(),
    const ProductExploreScreen(),
    const ProductExplore(),
    const ProductExplore(),
    const ProductExplore(),
    const ProductExplore(),
    const ProductExplore(),
    const ProductExplore(),
    const ProductExplore(),
    const ProductExplore(),
    const ProductExplore(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 5),
                child: Text(
                  "Explore Product",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${index + 1}/${list.length}", // Displays current page index
                style: const TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 1000,
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  children:list,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

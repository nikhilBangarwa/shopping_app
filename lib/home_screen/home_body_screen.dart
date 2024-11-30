import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomImageSlider extends StatelessWidget {
  const CustomImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child: CarouselSlider(
          items: [
            Image.network(
                'https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/15f5da389ef3c428.jpeg?q=20',cacheHeight: 400,width: double.infinity,fit: BoxFit.cover,),
            Image.network(
                'https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/da4df321793ed4d1.jpg?q=20',cacheHeight: 400,width: double.infinity,fit: BoxFit.cover,),
            Image.network(
                'https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/126619f56d1f3607.jpg?q=20',cacheHeight: 400,width: double.infinity,fit: BoxFit.cover,),
            Image.network(
                'https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/c909fa32d7ffdb95.jpg?q=20',cacheHeight: 400,width: double.infinity,fit: BoxFit.cover,),
            Image.network(
                'https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/6cf92d4c96015eca.jpeg?q=20',cacheHeight: 400,width: double.infinity,fit: BoxFit.cover,),
          ],
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration:
            const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}

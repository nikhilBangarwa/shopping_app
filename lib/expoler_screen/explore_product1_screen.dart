import 'package:flutter/material.dart';
import 'package:shopping_app/model_screen/multipart_list_screen.dart';

class ProductExplore extends StatefulWidget {
  const ProductExplore({super.key});



  @override
  State<ProductExplore> createState() => _ProductExploreState();
}

class _ProductExploreState extends State<ProductExplore> {
  List<MultipleList> list = [
    MultipleList(
      title: 'CAMPUS SURA Women Regular Fit Solid\nSpread Collar Casual Shirt ',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/x/6/e/xl-sum24-cswssrt7505-campus-sutra-original-imah64hhvjtgbveg.jpeg?q=70',
      price: '₹749 50% off',
    ),
    MultipleList(
      title: 'Noise Icon 2 1.8'' Display with Bluetooth ,Regular',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/smartwatch/r/y/f/-original-imagxp8tmkqqspa4.jpeg?q=70',
      price: '₹1,399 76% off',
    ),
    MultipleList(
      title: 'AutoPowers Motorcycle Mini Yellow/White LED Fog Light ...',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/vehicle-light-bulb/e/a/l/-original-imah4y86jfn7kgs3.jpeg?q=70',
      price: '₹350 64% off',
    ),
    MultipleList(
      title: 'Analog Wall Clock Black\nWith Glass',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/headphone/u/d/p/-original-imaghzfzswz8pmxf.jpeg?q=70',
      price: '88% off ₹289',
    ),
    MultipleList(
      title: 'BLU CAPS Solid Sports/Regular Cap Pack of 2',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/cap/j/s/u/free-solid-sports-regular-cap-pack-of-2-blucaps-original-imah4jqqmapzbahk.jpeg?q=70',
      price: '₹229 90%off',
    ),
    MultipleList(
      title: 'vtb retail Teddy Bear 4 Feet valentines gift',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/stuffed-toy/s/u/r/teddy-bear-4-feet-valentines-gift-for-girls-121-92-vtb-retail-original-imah5wxnpuxcchqt.jpeg?q=70',
      price: '₹364 85% off',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.6, // Adjusted to control item height
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          MultipleList item = list[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.green),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image Section
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      image: DecorationImage(
                        image: NetworkImage(item.image,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Title and Price Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      // Price
                      Text(
                        item.price,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

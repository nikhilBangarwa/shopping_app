import 'package:flutter/material.dart';
import 'package:shopping_app/model_screen/multipart_list_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<MultipleList> list = [
    MultipleList(
      title: 'NOVA NHP \nDryer2000 W, Rose Gold4',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/slipper-flip-flop/p/a/k/-original-imah4a8vsggfrcje.jpeg?q=70',
      price: '₹295  56% off',
    ),
    MultipleList(
      title: 'Analog Wall Clock Black\nWith Glass',
      image:
      'https://rukminim2.flixcart.com/image/612/612/kqo3onk0/wall-clock/g/k/u/fancy-and-designer-wall-clock-for-home-offices-bedroom-living-original-imag4hyvahrggekr.jpeg?q=70',
      price: '88% off ₹289',
    ),
    MultipleList(
      title: 'Deals4youSneakers For Women',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/g/z/2/4-1335-wt-4-deals4you-camel-original-imahf82scegrzawt.jpeg?q=70',
      price: '₹469 68% off ',
    ),
    MultipleList(
      title: 'VECHLOTrendy Sneakers For Men',
      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/d/f/h/8-807-42-vechlo-white1-original-imah542vydgxjyxr.jpeg?q=70',
      price: '₹547 45% off',
    ),
    MultipleList(
  title: 'ICON FASHION Men Regular Fit Solid\nSpread Collar Casual Shirt ₹369₹1,99981% off',


      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/e/j/6/l-i212-dp-khushi-creation-original-imah4x2g2kzzjfhy.jpeg?q=70',
      price: '₹369 81% off',
    ),
    MultipleList(
  title: 'Girls Regular Fit Self Design Casual Shirt ₹699',


      image:
      'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/g/g/n/xs-p2p216519067001-people-original-imafknuppyq6xfag-bb.jpeg?q=70',
      price: '₹369 81% off',
    ),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 40.0,
          crossAxisSpacing: 40.0,
          childAspectRatio: 0.6, // Adjusted to control item height
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          MultipleList item = list[index];
          return Expanded(
            child: Container(
            width: double.infinity,
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
            ),
          );
        },
      ),
    );
  }
}

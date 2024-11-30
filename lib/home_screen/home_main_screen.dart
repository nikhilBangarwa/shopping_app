import 'package:flutter/material.dart';

class CustomImages extends StatelessWidget {
  const CustomImages({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: 130,

      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Column(
                children: [
                  Image.network(
                      'https://rukminim1.flixcart.com/flap/80/80/image/29327f40e9c4d26b.png?q=100',),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Grocery')
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Image.network(
                        'https://rukminim1.flixcart.com/flap/80/80/image/22fddf3c7da4c4f4.png?q=100'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Mobiles')
                  ],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Image.network(
                      'https://rukminim1.flixcart.com/fk-p-flap/80/80/image/0d75b34f7d8fbcb3.png?q=100'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Fashion')
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Image.network(
                      'https://rukminim1.flixcart.com/flap/80/80/image/69c6589653afdb9a.png?q=100'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Electronic')
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Image.network(
                      'https://rukminim1.flixcart.com/flap/80/80/image/ab7e2b022a4587dd.jpg?q=100'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Home &\n Furniture')
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Image.network(
                      'https://rukminim1.flixcart.com/fk-p-flap/80/80/image/0139228b2f7eb413.jpg?q=100'),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Appliances'),
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Image.network(
                      'https://rukminim1.flixcart.com/fk-p-flap/80/80/image/05d708653beff580.png?q=100'),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('Two Wheelers'),
                ],
              ),
            ],
          )),
    );
  }
}

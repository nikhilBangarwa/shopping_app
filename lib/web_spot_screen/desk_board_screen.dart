import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/home_screen/home_body_screen.dart';
import 'package:shopping_app/home_screen/home_main_screen.dart';
import 'package:shopping_app/model_screen/user_imformesn.dart';
import 'package:shopping_app/product/view/product_list_screen.dart';

class DeskBoardScreen extends StatefulWidget {
  const DeskBoardScreen({super.key});

  @override
  State<DeskBoardScreen> createState() => _DeskBoardScreenState();
}

class _DeskBoardScreenState extends State<DeskBoardScreen> {
  List<ProductList> productList = [
    ProductList(
      title: 'BataMen Slippers',
      image:
          'https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/4/y/b/-original-imahyzygycuyg3mq.jpeg?q=70',
    ),
    ProductList(
      title: 'Ballmer Casual Shirt',
      image:
          'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/o/b/1/s-topaah-indicare-original-imah3h88hqvhahcq.jpeg?q=70',
    ),
    ProductList(
      title: 'indicate Casual Shirt',
      image:
          'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/m/t/e/xl-bul-24bshs-11-bullmer-original-imah4c6h5hemzacx.jpeg?q=70',
    ),
    ProductList(
      title: 'realm P1 Pro 5G',
      image:
          'https://rukminim2.flixcart.com/image/612/612/xif0q/slipper-flip-flop/e/l/a/-original-imah2c46us2ynhk5.jpeg?q=70',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeskBoard Screen'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Drawer(
              child: DrawerHeader(
                  child: Column(
                children: [
                  Image.network(
                      'https://images.yourstory.com/cs/2/220356402d6d11e9aa979329348d4c3e/Flipkart-1582211499554.jpg?mode=crop&crop=faces&ar=2%3A1&format=auto&w=1920&q=75'),
                  const ListTile(
                    leading: Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.category,
                      size: 30,
                      color: Colors.red,
                    ),
                    title: Text(
                      'category',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.production_quantity_limits_rounded,
                      size: 30,
                      color: Colors.red,
                    ),
                    title: Text(
                      'product',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.shopping_cart_rounded,
                      size: 30,
                    ),
                    title: Text(
                      'shopping',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      size: 30,
                    ),
                    title: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
          Expanded(
              flex: 3,
              child: Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomImages(),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomImageSlider(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'All Best Product ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const ProductListScreen();
                                }));
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            ProductList product = productList[index];
                            return SizedBox(
                              height: 600,
                              child: GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3, color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Image.network(product.image),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Only 499 product',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                              ))
                        ],
                      ),
                    ),
                    padding(
                      'https://rukminim2.flixcart.com/image/612/612/xif0q/ethnic-set/y/i/p/m-151kbd1635i-skylee-original-imah2zagshxggesg.jpeg?q=70',
                      'SkylerWomen Viscose  Set',
                      '  From ₹499 ',
                    ),
                    padding(
                      'https://rukminim2.flixcart.com/image/612/612/xif0q/watch/0/e/s/-original-imagrh69yhhwugfu.jpeg?q=70',
                      'SONATAS analog Watch - ',
                      '  From ₹499 ',
                    ),
                    padding(
                      'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/4/v/i/l-sugr-shirt01-fuback-original-imah4zz7bxbzatnd.jpeg?q=70',
                      'FULLBACK Casual Shirt ',
                      '  From ₹499 ',
                    ),
                  ],
                ),
              ))),
          Expanded(
            flex: 1,
            child: CarouselSlider(
                items: [
                  Image.network(
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/l/a/p/m-men-slim-fit-printed-spread-collar-casual-shirt-sys-bella-original-imah4cdqgk8yaryz.jpeg?q=70',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Image.network(
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/slipper-flip-flop/7/o/d/10-na-rg2218-radhika-group-white-original-imagz8pscpbhdhsb.jpeg?q=70',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Image.network(
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/h/a/i/8-mrj2100-8-aadi-white-black-grey-original-imagn8yketvx3h8h.jpeg?q=70',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Image.network(
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/jacket/w/r/6/l-no-mn23-shacket-hs-fzip-bgrn-3pckt-maniac-original-imagv2tgvgqfhxtx.jpeg?q=70',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Image.network(
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/kids-slipper-flip-flop/n/p/b/-original-imahy88vypsrpa5s.jpeg?q=70',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Image.network(
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/kids-ethnic-set/d/m/b/0-6-months-na-sp-1-year-ultrina-original-imagzcg5gchuagaa.jpeg?q=70',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Image.network(
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/kids-ethnic-set/d/m/b/0-6-months-na-sp-1-year-ultrina-original-imagzcg5gchuagaa.jpeg?q=70',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300,
                  ),

                ],
                options: CarouselOptions(
                  height: 1000,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.vertical,
                )),
          )
        ],
      ),
    );
  }

  Widget padding(String image, String text, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  image,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Text(
                subtitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}

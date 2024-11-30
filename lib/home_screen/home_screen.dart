import 'package:flutter/material.dart';
import 'package:shopping_app/details_screen/text_screen.dart';
import 'package:shopping_app/home_screen/home_body_screen.dart';
import 'package:shopping_app/home_screen/home_main_screen.dart';
import 'package:shopping_app/model_screen/user_imformesn.dart';
import 'package:shopping_app/product/view/product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HowState();
}

class _HowState extends State<HomeScreen> {
  bool isTrue = false;
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
      drawer: Drawer(
        child: DrawerHeader(
            child: Column(
              children: [
                Image.network(
                  'https://images.yourstory.com/cs/2/220356402d6d11e9aa979329348d4c3e/Flipkart-1582211499554.jpg?mode=crop&crop=faces&ar=2%3A1&format=auto&w=1920&q=75',
                  height: 150,
                ),
                Divider(),
                buildListTile(Icon(Icons.home),'Home'),
                buildListTile(Icon(Icons.shopping_cart_rounded),'shopping'),
                buildListTile(Icon(Icons.category),'category'),
                buildListTile(Icon(Icons.production_quantity_limits),'product'),
              ],
            )),
      ),
      appBar: AppBar(
        title: const Text(TextScreen.homeScreen),
        actions: const [
          Row(
            children: [
              Icon(Icons.account_circle),
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.shopping_cart_rounded),
              SizedBox(
                width: 15,
              ),
            ],
          )
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    isTrue ? "Brand on" : " Brand Off",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Switch(
                      value: isTrue,
                      onChanged: (value) {
                        setState(() {
                          isTrue = value;
                        });
                      }),
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search Your Product ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ))
            ],
          ),
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            border: Border.all(width: 3, color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
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

  Widget buildListTile( Icon icon,text) {
    return ListTile(
      leading: icon,
      title: Text(text),
    );
  }
}

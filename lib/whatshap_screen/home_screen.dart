import 'package:flutter/material.dart';
import 'package:shopping_app/whatsAap_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ModelScreen> list = [
    ModelScreen(
        img:
            'https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/4/y/b/-original-imahyzygycuyg3mq.jpeg?q=70',
        title: 'Anu Dharma',
        subtitle: 'ksa h tu'),
    ModelScreen(
      img:
          'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/o/b/1/s-topaah-indicare-original-imah3h88hqvhahcq.jpeg?q=70',
      title: 'Ballmer Casual Shirt',
      subtitle: 'what h tu',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          'WhatsAap ',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 20,
        actions: [
          const Icon(
            Icons.backup_table,
            color: Colors.white,
          ),
          const SizedBox(
            width: 13,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              )),
         PopupMenuButton(itemBuilder: (context){
           return [
             PopupMenuItem(child: Text(''))
           ];
         })
          const SizedBox(
            width: 13,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Ask Meta Al or Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "All",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "Unheard",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "Favorite",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "Groups",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    ModelScreen model = list[index];
                    return ListTile(
                        title: Text(model.title),
                        subtitle: Text(model.subtitle),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(model.img),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

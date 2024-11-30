import 'package:flutter/material.dart';
import 'package:shopping_app/screen/setting_screen.dart';
import 'package:shopping_app/whatshap_screen/call_screen.dart';
import 'package:shopping_app/whatshap_screen/home_screen.dart';

import 'package:shopping_app/whatshap_screen/updates_screen.dart';

class WhatsAapScrollScreen extends StatefulWidget {
  const WhatsAapScrollScreen({super.key});

  @override
  State<WhatsAapScrollScreen> createState() => _WhatsAapScrollScreenState();
}

class _WhatsAapScrollScreenState extends State<WhatsAapScrollScreen> {
  final controller = PageController(initialPage: 0);
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            index = value;
          });
        },
        children: const [
          HomeScreen(),
          UpdatesScreen(),
          CallScreen(),
          SettingScreen()
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                    controller.jumpToPage(0);
                  });
                },
                icon: Icon(
                  Icons.home,
                  size: 35,
                  color: index == 0 ? Colors.red : Colors.grey,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                    controller.jumpToPage(1);
                  });
                },
                icon: Icon(
                  Icons.update,
                  size: 35,
                  color: index == 1 ? Colors.red : Colors.grey,
                )
            ),
            IconButton(onPressed: (){
              setState(() {
                index=2;
                controller.jumpToPage(2);
              });
            },icon: Icon(Icons.call,size:35,color: index==2?Colors.red:Colors.grey,)),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 3;
                    controller.jumpToPage(3);
                  });
                },
                icon: Icon(
                  Icons.settings,
                  size: 35,
                  color: index == 3 ? Colors.red : Colors.grey,
                )
            ),
          ],
        ),
      ),
    );
  }
}

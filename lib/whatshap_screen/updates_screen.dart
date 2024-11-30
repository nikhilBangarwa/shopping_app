import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/whatsaap_api/provider/news_provider.dart';
import 'package:shopping_app/whatsaap_api/service/model_screen.dart';
import 'package:shopping_app/whatsaap_api/view/all_news_details.dart';
import 'package:shopping_app/whatsaap_api/view/news_details.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  bool isTrue = false;
  String? path;
  @override
  void initState() {
   fetchData();
    super.initState();
  }
  void fetchData()async{
    NewsProvider newsProvider=Provider.of<NewsProvider>(context,listen: false);
    newsProvider.fetchProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: customApp(),
      ),
      body: customBody(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){},child: const Icon(Icons.add),),
          const SizedBox(height: 10,),
           path!=null?Image.file(File(path!)):Text('No image'),
          FloatingActionButton(onPressed: ()async{
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(source: ImageSource.gallery);
            if(image!=null){
              path=image.path;
              setState(() {

              });
            }
          },child: const Icon(Icons.camera_alt))
        ],
      ),
    );
  }

  Widget customApp() {
    return AppBar(
      title: isTrue
          ? const TextField(
        decoration: InputDecoration(
            hintText: 'search', border: InputBorder.none),
      )
          : const Text('Updates'),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
        IconButton(
            onPressed: () {
              setState(() {
                isTrue = !isTrue;
              });
            },
            icon: isTrue
                ? const Icon(Icons.cancel)
                : const Icon(Icons.search))
      ],
    );
  }

  Widget customBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Status',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 17),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s',
                              ),
                            ),
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("My status",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s',
                          ),
                        ),
                      ],
                    ),
                    Text('Nisha Dharni',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)

                  ],
                ),
              ),
              SizedBox(width: 15,),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s',
                          ),
                        ),
                      ],
                    ),
                    Text(' Sachin bhai',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)

                  ],
                ),
              )
              ,
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Channels',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const NewsDetailsScreen();
                  }));
                }, child: const Text("Explore",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Find channels",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
          ),
          Consumer<NewsProvider>(
            builder: (context, provider, child) {
              List<Articles> displayArticles=provider.articleList.take(6).toList();

              return SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: displayArticles.length,
                        itemBuilder: (context, index) {
                          final product = displayArticles[index];
                          return ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return NewsDetails(articles: product,);
                              }));
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(product.urlToImage ?? ''),
                            ),
                            title: Text(product.title ?? ''),
                            subtitle: Text(product.description ?? ''),
                          );
                        },
                      ),
                    ),

                  ],
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12,right: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','Aaj tak'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s',' Rk Dalal'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),
                  container('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_TK2p9MeOszv0xRMR78mzS5Rrsa2C8aBOQ&s','total Gaming'),

                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),

              child:  const Text('Explore',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }

  Widget container(String img,String title,) {
    return Container(
      margin: const EdgeInsets.all(7),
                width: MediaQuery.of(context).size.width*0.40,
                height: 200,

                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     CircleAvatar(
                      backgroundImage: NetworkImage(img),
                      radius: 35,
                    ),
                    const SizedBox(height: 5,),
                     Text(title,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                    Container(
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.green,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:  const Text('Follow',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),),
                    )
                  ],
                ),
              );
  }
}

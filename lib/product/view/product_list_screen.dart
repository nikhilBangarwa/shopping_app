import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/product/model/products_model.dart';
import 'package:shopping_app/product/provider/product_provider.dart';
import 'package:shopping_app/product/view/add_%20product_screen.dart';
import 'package:shopping_app/product/view/product_Details_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool isSearch = false;
  final searchController = TextEditingController();
  List<Products> filteredProductList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    searchController.addListener(onSearch);
  }

  void fetchData() {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchValue().then((_) {
      setState(() {
        filteredProductList = productProvider.productList;
      });
    });
  }

  void onSearch() {
    String search = searchController.text.toLowerCase();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    if (search.isEmpty) {
      setState(() {
        filteredProductList = productProvider.productList;
      });
    } else {
      setState(() {
        filteredProductList = productProvider.productList
            .where((product) => product.title!.toLowerCase().contains(search))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    searchController.removeListener(onSearch);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddScreen();
          }));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: isSearch
            ? const TextField(
                decoration: InputDecoration(
                  labelText: 'Search your product ',
                  border: InputBorder.none,
                ),
              )
            : const Text('Product Screen'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearch = !isSearch;
                  if (!isSearch) {
                    searchController.clear();
                    filteredProductList =
                        Provider.of<ProductProvider>(context, listen: false)
                            .productList;
                  }
                });
              },
              icon: Icon(isSearch ? Icons.cancel : Icons.search))
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: filteredProductList.length,
            itemBuilder: (context, index) {
              Products product = filteredProductList[index];
              double finalPrice = product.discountPercentage != null
                  ? product.price! * (1 - product.discountPercentage! / 100)
                  : product.price!;
              String formattedPrice =
                  NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                      .format(finalPrice);

              return ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: product.thumbnail != null
                        ? Image.network(
                            product.thumbnail!,
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.image_aspect_ratio_outlined,
                          ),
                  ),
                ),
                title: Text(
                  product.title.toString(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedPrice,
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    if (product.discountPercentage != null)
                      Text(
                        " Discount ${product.discountPercentage}",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 13,
                        ),
                      )
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 30,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailsScreen(
                      products: product,
                    );
                  }));
                },
              );
            },
          );
        },
      ),
    );
  }
}

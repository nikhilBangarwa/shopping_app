import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';

import 'package:shopping_app/product/model/products_model.dart';
import 'package:shopping_app/product/provider/product_provider.dart';
import 'package:shopping_app/product/view/product_order_screen.dart';

class DetailsScreen extends StatefulWidget {
  final Products products;

  const DetailsScreen({super.key, required this.products});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double finalPrice = widget.products.discountPercentage != null
        ? widget.products.price! *
            (1 - widget.products.discountPercentage! / 100)
        : widget.products.price!;
    String formattedPrice =
        NumberFormat.currency(symbol: '\$', decimalDigits: 2)
            .format(finalPrice);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent,
          title:  Text(
             widget.products.title??'',
            style: const TextStyle(color: Colors.black),
          ),
          actions:  [
           IconButton(onPressed: (){
             ProductProvider productProvider=Provider.of<ProductProvider>(context,listen: false);
             productProvider.deleteProduct(widget.products.id??0);
           }, icon: const Icon(Icons.delete)),
            const SizedBox(
              width: 15,
            ),
            const Icon(
              Icons.shopping_cart_rounded,
              size: 25,
              color: Colors.black,
            ),
            const SizedBox(
              width: 15,
            ),

            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 350,
                        child: ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount:widget.products.images!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SizedBox(
                                  width: 400,
                                  child: widget.products.images != null
                                      ? Image.network(
                                    widget.products.images![index],
                                    width: 400,
                                    fit: BoxFit.cover,
                                  )
                                      : const Icon(
                                    Icons.image_aspect_ratio_outlined,
                                  ),
                                ),
                              );
                            }),
                      ),
                      Positioned(
                        top: 10,
                        right: 20,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: fetch,
                              icon: const Icon(Icons.favorite),
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                            IconButton(
                                onPressed: () {
                                  // Share.share( widget.products.images.toString(), subject: widget.products.title);
                                },
                                icon: const Icon(Icons.share)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.products.title.toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 30,
                            color: Colors.blue,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(formattedPrice,
                              style: const TextStyle(
                                fontSize: 19,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          if (widget.products.discountPercentage != null)
                            Text(
                              "${widget.products.discountPercentage}% off",
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      Text(widget.products.description.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.products.rating}/5 ",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            const Icon(Icons.star,
                                size: 25, color: Colors.amber),
                            const Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.amber,
                            ),
                            const Text(
                              'Best Rating product',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Product Details',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                      Text(widget.products.shippingInformation.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                      Text(
                        " Warranty: ${widget.products.warrantyInformation}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(" Return Product: ${widget.products.returnPolicy}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        " Category:${widget.products.category}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Flexible(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            height: 70,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const ProductOrderScreen();
                          }));
                        },
                        child: Flexible(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            height: 70,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Buy now',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Custom Reviews",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                      Row(
                        children: [
                          Text(
                            widget.products.reviews![0].reviewerName.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(widget.products.reviews![0].comment.toString(), style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),)
                        ],
                      ),
                      Text(widget.products.reviews![0].date.toString()),
                      Text(widget.products.reviews![0].reviewerEmail.toString(), style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      )
                    ],
                  ),
                ],
              )),
        ));
  }

  void fetch() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
}

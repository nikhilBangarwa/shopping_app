import 'package:flutter/material.dart';
import 'package:shopping_app/product/view/product_oder_detail_screen.dart';

class ProductOrderScreen extends StatefulWidget {
  const ProductOrderScreen({super.key});

  @override
  State<ProductOrderScreen> createState() => _ProductOrderScreenState();
}

class _ProductOrderScreenState extends State<ProductOrderScreen> {

  final nameController= TextEditingController();
  final phoneController= TextEditingController();
  final pinCodeController= TextEditingController();
  final addressCodeController= TextEditingController();
  final cityCodeController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add Delivery address',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        actions: const [
          Icon(Icons.favorite,size: 23,),
          SizedBox(width: 10,),
          Icon(Icons.error_outline,size: 23,),
          SizedBox(width: 10,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Full Name (required)*',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'phone number (required)*',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            const Text('+ Add Alternate phone Number',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.blue)),
            const SizedBox(height: 10),
            const Text(
              'pleas wait,while we get the details',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextField(
                    controller: pinCodeController,
                    decoration: InputDecoration(
                        labelText: 'PinCode (Required)*',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    height: 50,
                    width: 230,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.location_on,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Use my location',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'state (Required)*',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextField(
                    controller: cityCodeController,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search),
                        labelText: 'City (Required)*',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: addressCodeController,
              decoration: InputDecoration(
                  labelText: ' House No,Building Name (required)*',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  labelText: ' Road name,Area Colony (required)*',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
                '+ Add Nearby '
                'Famous Shop/Mall/Landmark',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.blue)),
            const SizedBox(
              height: 10,
            ),
            const Text('Type of Address',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                buildContainer('Home', const Icon(Icons.home)),
                buildContainer('work', const Icon(Icons.keyboard_hide_sharp)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ProductOderDetailScreen(

                    name: nameController.text,
                    city: cityCodeController.text,
                    pinCode: pinCodeController.text,
                    address: addressCodeController.text,
                  );
                }));
              },
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(50),
                    ),
                ),
                child: const Text('Save Address',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.white ),),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainer(String text, Icon icon) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 30,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black54)),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Icon(
            icon.icon,
            size: 22,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

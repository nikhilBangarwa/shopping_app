import 'package:flutter/material.dart';
import 'package:shopping_app/core/store_helper.dart';
import 'package:shopping_app/details_screen/text_screen.dart';
import 'package:shopping_app/model_screen/user_model.dart';





class SighUpScreen extends StatefulWidget {
  const SighUpScreen({super.key});

  @override
  State<SighUpScreen> createState() => _SighUpScreenState();
}

class _SighUpScreenState extends State<SighUpScreen> {
  StoreHelperHelper storeHelper= StoreHelperHelper();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final conformController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TextScreen.title),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: TextScreen.email,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              buildSizedBox(12),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: TextScreen.password,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              buildSizedBox(12),
              TextField(
                controller: conformController,
                decoration: InputDecoration(
                    labelText: TextScreen.conform,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              buildSizedBox(12),
              ElevatedButton(onPressed: fetchData, child: const Text(TextScreen.create))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) =>  SizedBox(height: height,);
  void fetchData(){
    String email=emailController.text;
    String password=passwordController.text;
    String conform=conformController.text;

    if(password==conform){
      User user=User(email: email, password: password);
      storeHelper.saveData(user);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(TextScreen.scaffold)));
      Navigator.pop(context);
    }else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(TextScreen.scaffoldMessages)));

    }
  }
}

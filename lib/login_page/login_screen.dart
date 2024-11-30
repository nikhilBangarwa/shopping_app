import 'package:flutter/material.dart';
import 'package:shopping_app/core/store_helper.dart';
import 'package:shopping_app/details_screen/font_style_screen.dart';
import 'package:shopping_app/details_screen/text_screen.dart';
import 'package:shopping_app/home_screen/home_screen.dart';
import 'package:shopping_app/login_page/sigh_up_screen.dart';
import 'package:shopping_app/model_screen/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StoreHelperHelper storeHelper = StoreHelperHelper();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.email,color: Colors.white,),
                    labelText: TextScreen.email,
                    labelStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,color: Colors.red
                      )
                    )
                  ),
                ),
                buildSizedBox(13),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.password),
                    labelText: TextScreen.password,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                buildSizedBox(20),
                ElevatedButton(
                  onPressed: getData,
                  child: const Text(
                    TextScreen.login,
                    style: TextStyles.textStyles,
                  ),
                ),
                buildSizedBox(20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const SighUpScreen();
                      }),
                    );
                  },
                  child: const Text(
                    TextScreen.onPress,
                    style: TextStyles.textStyles,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getData() async {
    String email = emailController.text;
    String password = passwordController.text;
    User? save = await storeHelper.fetchData();
    if (save != null && email == save.email && password == save.password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            TextScreen.emailFound,
            style: TextStyles.scaffoldStyle,
          ),
        ),
      );
    }
  }

  SizedBox buildSizedBox(double height) => SizedBox(height: height);
}

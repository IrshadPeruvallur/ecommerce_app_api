import 'dart:developer';

import 'package:ecommerce_api/controller/data_provider.dart';
import 'package:ecommerce_api/controller/user_provider.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/view/home.dart';
import 'package:ecommerce_api/view/login_pages/login.dart';
import 'package:ecommerce_api/view/widgets/normel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? tokenId;

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .02,
              ),
              Text(
                "WELCOME",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: size.width * .07),
              ),
              SizedBox(
                height: size.width * .1,
              ),
              Card(
                elevation: size.width * .05,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(size.width * .04))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFieldWidget(size,
                          label: 'Name', controller: usernameController),
                      TextFieldWidget(size,
                          label: 'Email', controller: emailController),
                      TextFieldWidget(size,
                          label: 'Password', controller: passwordController),
                      SizedBox(
                        height: size.width * .18,
                      ),
                      BlackElevatedButton(size, label: 'Sign Up',
                          onPressed: () async {
                        await createUser(context);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => Home(),
                        // ));
                      }),
                      SizedBox(
                        height: size.width * .1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have account?'),
                          TextButtonWidget(size, context, label: 'SIGN IN',
                              onPressed: () {
                            Navigator.pop(context);
                          })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  createUser(context) async {
    final userInfo = await UserModel(
      username: usernameController.text.toString(),
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    );

    final getProvider = await Provider.of<UserProvider>(context, listen: false);
    await getProvider.createUser(userInfo);
    if (getProvider.createUser != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    }
  }
  // createUser(context) async {
  //   final userInfo = await UserModel(
  //     usernameController.text.toString(),
  //     emailController.text.toString(),
  //     passwordController.text.toString(),
  //   );

  //   final token = await Provider.of<DataProvider>(context, listen: false)
  //       .createUser(userInfo);

  //   if (token != null) {
  //     final sharedPreferences = await SharedPreferences.getInstance();
  //     sharedPreferences.setString('token', token);
  //     log("Token: $token");
  //   } else {
  //     log("Token not available");
  //   }
  // }
}

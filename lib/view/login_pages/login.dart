import 'dart:developer';
import 'package:ecommerce_api/controller/user_provider.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/view/home.dart';
import 'package:ecommerce_api/view/login_pages/sign_up.dart';
import 'package:ecommerce_api/view/widgets/normel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String tokenId = '';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .1,
              ),
              Text(
                "Hello!",
                style: TextStyle(fontSize: size.width * .12),
              ),
              Text(
                "WELCOME BACK",
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
                          label: 'Username', controller: usernameController),
                      TextFieldWidget(size,
                          label: 'Password', controller: passwordController),
                      SizedBox(
                        height: size.width * .1,
                      ),
                      BlackElevatedButton(
                        size,
                        label: 'Log in',
                        onPressed: () => userLogin(context),
                      ),
                      SizedBox(
                        height: size.width * .1,
                      ),
                      TextButtonWidget(size, context, label: 'SIGN UP',
                          onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ));
                      })
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

  userLogin(context) async {
    final userInfo = UserModel(
      username: usernameController.text.toString(),
      password: passwordController.text.toString(),
    );
    final getProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      await getProvider.userLogin(userInfo);
      log("Token : $tokenId");
      if (getProvider.userStatusCode == "200" && tokenId.isNotEmpty) {
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString('token', tokenId);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      log('Error during user login: $e');
    }
  }
}

import 'dart:developer';
import 'package:ecommerce_api/controller/store_provider.dart';
import 'package:ecommerce_api/controller/user_provider.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/view/main_screen.dart';
import 'package:ecommerce_api/view/login_pages/sign_up.dart';
import 'package:ecommerce_api/view/widgets/normel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final getProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formKey,
        child: Padding(
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
                        textFieldWidget(size,
                            label: 'Username',
                            controller: getProvider.usernameController),
                        textFieldWidget(size,
                            label: 'Password',
                            controller: getProvider.passwordController),
                        SizedBox(
                          height: size.width * .1,
                        ),
                        blackElevatedButton(
                          size,
                          label: 'Log in',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              userLogin(context);
                            }
                          },
                        ),
                        SizedBox(
                          height: size.width * .1,
                        ),
                        textButtonWidget(size, context, label: 'SIGN UP',
                            onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ));
                        }),
                        textButtonWidget(size, context, label: 'Guest Mode',
                            onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MainPage(),
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
      ),
    );
  }

  userLogin(context) async {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    final getStore = Provider.of<StoreProvider>(context, listen: false);
    final userInfo = UserModel(
      username: getProvider.usernameController.text.toString(),
      password: getProvider.passwordController.text.toString(),
    );

    try {
      await getProvider.userLogin(userInfo);
      final tokenId = await getStore.getValues('tokenId');
      if (getProvider.userStatusCode == "200" && tokenId != null) {
        await getProvider.setUserData();
        clearControllers(getProvider);
        showSuccessSnackbar(context, 'Successfully logged in!');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MainPage()));
      } else if (getProvider.userStatusCode == '500') {
        showErrorSnackbar(context, "no internet connction, try again");
      }
    } catch (e) {
      showErrorSnackbar(context, 'Username and password do not match.');
      log('Error during user login: $e');
    }
  }
}

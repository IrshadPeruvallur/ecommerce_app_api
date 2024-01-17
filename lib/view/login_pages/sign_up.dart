import 'dart:developer';

import 'package:ecommerce_api/controller/data_provider.dart';
import 'package:ecommerce_api/controller/user_provider.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/view/tabs/home.dart';
import 'package:ecommerce_api/view/login_pages/login.dart';
import 'package:ecommerce_api/view/widgets/normel_widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? tokenId;

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<UserProvider>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                        TextFieldWidget(
                          size,
                          label: 'Name',
                          controller: getProvider.usernameController,
                        ),
                        TextFormField(
                          // inputFormatters:filt
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return " Please enter email address";
                            } else if (!EmailValidator.validate(value)) {
                              return " Please enter a valid email address";
                            } else {
                              return null;
                            }
                          },
                          controller: getProvider.emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        TextFieldWidget(
                          size,
                          label: 'Password',
                          controller: getProvider.passwordController,
                        ),
                        SizedBox(
                          height: size.width * .18,
                        ),
                        BlackElevatedButton(size, label: 'Sign Up',
                            onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await createUser(context);
                          }

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
      ),
    );
  }

  createUser(context) async {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    final userInfo = await UserModel(
      username: getProvider.usernameController.text.toString(),
      email: getProvider.emailController.text.toString(),
      password: getProvider.passwordController.text.toString(),
    );
    await getProvider.createUser(userInfo);
    if (getProvider.createdStatusCode == "201") {
      showSuccessSnackbar(context, 'Account created successfully!');
      clearControllers(getProvider);
    } else {
      showErrorSnackbar(
          context, 'Failed to create an account. Please try again.');
    }
  }
}

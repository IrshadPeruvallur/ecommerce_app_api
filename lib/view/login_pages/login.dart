import 'package:ecommerce_api/view/login_pages/sign_up.dart';
import 'package:ecommerce_api/view/widgets/normel_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                      TextFieldWidget(size, label: 'Email or Username'),
                      TextFieldWidget(size, label: 'Password'),
                      SizedBox(
                        height: size.width * .1,
                      ),
                      BlackElevatedButton(size, label: 'Log in'),
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
}

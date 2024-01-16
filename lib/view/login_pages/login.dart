import 'package:ecommerce_api/view/login_pages/sign_in.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                      TextFormField(),
                      SizedBox(
                        height: size.width * .05,
                      ),
                      TextFormField(),
                      SizedBox(
                        height: size.width * .18,
                      ),
                      SizedBox(
                        height: size.width * .14,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                elevation:
                                    MaterialStatePropertyAll(size.width * .07),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black)),
                            onPressed: () {},
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: size.width * .045,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            )),
                      ),
                      SizedBox(
                        height: size.width * .1,
                      ),
                      TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  const Color.fromARGB(227, 227, 227, 227))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ));
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                                fontSize: size.width * .04,
                                color: Colors.black),
                          ))
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

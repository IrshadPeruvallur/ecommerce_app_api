import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                      TextFormField(),
                      SizedBox(
                        height: size.width * .05,
                      ),
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
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: size.width * .045,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            )),
                      ),
                      SizedBox(
                        height: size.width * .1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have account?'),
                          TextButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                    fontSize: size.width * .04,
                                    color: Colors.black),
                              )),
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
}

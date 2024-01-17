import 'package:ecommerce_api/view/tabs/home.dart';
import 'package:ecommerce_api/view/login_pages/login.dart';
import 'package:ecommerce_api/view/main_screen.dart';
import 'package:ecommerce_api/view/widgets/normel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .4,
                  ),
                  Text(
                    'MAKE YOUR',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Text('HOME BEAUTIFUL',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                  Text(
                      'The best simple place where you discover most wonderful furnitures and make your home beautiful'),
                ],
              ),
              Positioned(
                bottom: 150,
                left: 100,
                right: 100,
                child: RectangularButton(
                  size,
                  name: 'Get Started',
                  onPressed: () async {
                    await checkLogin(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkLogin(context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPreferences.getString('token');
    if (userLoggedIn == null || userLoggedIn.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    }
  }
}

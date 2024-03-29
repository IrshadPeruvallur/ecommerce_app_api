// ignore_for_file: must_be_immutable

import 'package:ecommerce_api/controller/bottom_provider.dart';
import 'package:ecommerce_api/controller/store_provider.dart';
import 'package:ecommerce_api/controller/user_provider.dart';
import 'package:ecommerce_api/view/blank_page.dart';
import 'package:ecommerce_api/view/pages/cart_page.dart';
import 'package:ecommerce_api/view/tabs/profile_pages/settings.dart';
import 'package:ecommerce_api/view/tabs/wishlist_tab.dart';
import 'package:ecommerce_api/view/welcome/welcome.dart';
import 'package:ecommerce_api/view/widgets/normel_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  final List listTitles = [
    'my orders',
    'shipping adress',
    'Wishlist',
    'cart',
    'settings',
  ];

  final List listSubTitles = [
    'Already have 10 orders',
    '03 Addresses',
    'You have 2 cards',
    'You have 2 carts',
    'Notification, Password, FAQ, Contact',
  ];

  final List<Widget> listTabs = [
    const BlankPage(name: 'MY ORDERS'),
    const BlankPage(
      name: 'SHIPPING ADRESS',
    ),
    const WishListTab(),
    const CartPage(),
    const SettingsPage(),
  ];

  String? username;

  String? email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                logOut(context);
              },
              icon: const Icon(
                EneftyIcons.logout_outline,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/profile icons.png'),
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: size.width * .03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<UserProvider>(builder: (context, value, child) {
                      return Text(
                        value.username.isEmpty
                            ? 'username'
                            : value.username.toUpperCase(),
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .05,
                        ),
                      );
                    }),
                    Consumer<UserProvider>(builder: (context, value, child) {
                      return Text(
                        value.email.isEmpty ? 'email' : value.email,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * .035,
                        ),
                      );
                    })
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.width * .1,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Material(
                  elevation: 20,
                  shadowColor: const Color.fromARGB(48, 0, 0, 0),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => listTabs[index],
                        )),
                    title: Text(
                      listTitles[index].toString().toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .04,
                      ),
                    ),
                    subtitle: Text(
                      listSubTitles[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .03,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                        size: size.width * 0.055),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: size.width * .05,
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logOut(context) async {
    final getProvider = Provider.of<StoreProvider>(context, listen: false);
    getProvider.clearValues();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Welcome(),
        ),
        (route) => false);

    showSuccessSnackbar(context, 'Log out Successfully');
    Provider.of<BottomProvider>(
      context,
      listen: false,
    ).bottomFunction(0);
  }
}

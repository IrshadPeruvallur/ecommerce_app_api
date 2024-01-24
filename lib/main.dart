// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_api/controller/bottom_provider.dart';
import 'package:ecommerce_api/controller/product_provider.dart';
import 'package:ecommerce_api/controller/pages_controller/setting_page_controller.dart';
import 'package:ecommerce_api/controller/search_provider.dart';
import 'package:ecommerce_api/controller/store_provider.dart';
import 'package:ecommerce_api/controller/user_provider.dart';
import 'package:ecommerce_api/controller/wishlist_provider.dart';
import 'package:ecommerce_api/view/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StoreProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
              titleLarge: GoogleFonts.yesevaOne(fontWeight: FontWeight.w700),
              bodyLarge: GoogleFonts.montserrat(),
              bodyMedium: GoogleFonts.montserrat(),
              displayLarge: GoogleFonts.montserrat(),
              displayMedium: GoogleFonts.montserrat(),
            ),
            colorScheme: const ColorScheme.light(),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0)),
        debugShowCheckedModeBanner: false,
        home: const Welcome(),
      ),
    );
  }
}

import 'package:ecommerce_api/controller/data_provider.dart';
import 'package:ecommerce_api/view/home.dart';
import 'package:ecommerce_api/view/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
              titleLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
              bodyLarge: GoogleFonts.montserrat(),
              bodyMedium: GoogleFonts.montserrat(),
              displayLarge: GoogleFonts.montserrat(),
              displayMedium: GoogleFonts.montserrat(),
            ),
            colorScheme: ColorScheme.light(),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0)),
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

RectangularButton(Size size,
    {required String name, required VoidCallback? onPressed}) {
  return SizedBox(
    height: size.height * .08,
    width: size.width * .2,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(190, 0, 0, 0)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: onPressed,
      child: Text(name,
          style: GoogleFonts.montserrat(
              fontSize: size.width * .04,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400)),
    ),
  );
}

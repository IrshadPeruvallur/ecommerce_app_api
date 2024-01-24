import 'package:ecommerce_api/controller/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
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

Widget textFieldWidget(
  Size size, {
  controller,
  label,
  TextInputFormatter? inputFormatter,
  TextInputType? keyboardType,
}) {
  return Column(
    children: [
      TextFormField(
        inputFormatters: inputFormatter != null ? [inputFormatter] : [],
        keyboardType: keyboardType ?? TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return " Please enter $label";
          } else {
            return null;
          }
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
      SizedBox(
        height: size.width * .05,
      )
    ],
  );
}

Widget blackElevatedButton(size, {required label, VoidCallback? onPressed}) {
  return SizedBox(
    height: size.width * .14,
    width: double.infinity,
    child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(size.width * .07),
            backgroundColor: const MaterialStatePropertyAll(Colors.black)),
        onPressed: () {
          onPressed!();
        },
        child: Text(
          label,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: size.width * .045,
              color: const Color.fromARGB(255, 255, 255, 255)),
        )),
  );
}

Widget textButtonWidget(size, context,
    {required label, required VoidCallback? onPressed}) {
  return TextButton(
      style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: () {
        onPressed!();
      },
      child: Text(
        label,
        style: TextStyle(fontSize: size.width * .04, color: Colors.black),
      ));
}

void showSuccessSnackbar(BuildContext context, String message) {
  final snackbar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void showErrorSnackbar(BuildContext context, String message) {
  final snackbar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void clearControllers(UserProvider controller) {
  controller.usernameController.clear();
  controller.emailController.clear();
  controller.passwordController.clear();
}

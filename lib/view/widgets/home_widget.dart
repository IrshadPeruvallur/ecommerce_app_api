import 'package:flutter/material.dart';

topBarIcon(size, {icon, VoidCallback? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
        width: size.width * .15,
        height: size.width * .15,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 234, 234),
            borderRadius: BorderRadius.circular(15)),
        child: IconButton(
            onPressed: () {
              onPressed;
            },
            icon: Icon(icon))),
  );
}

prodectShow(size, {required imagepath, required description, required prize}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: size.width * .45,
        height: size.width * .55,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 106, 106, 106),
            image: DecorationImage(image: AssetImage(imagepath)),
            borderRadius: BorderRadius.circular(20)),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(width: size.width * .45, child: Text(description)),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '₹${prize}',
          style: TextStyle(
              fontSize: size.width * 0.045, fontWeight: FontWeight.w600),
        ),
      )
    ],
  );
}

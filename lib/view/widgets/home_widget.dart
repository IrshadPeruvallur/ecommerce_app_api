import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

Widget topBarIcon(Size size, {required IconData icon}) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Icon(
      icon,
      color: Colors.black,
      size: size.width * 0.06,
    ),
  );
}

Widget prodectShow(Size size,
    {required String description,
    required title,
    required String imagepath,
    required String prize}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Stack(children: [
            Positioned(
                top: 1,
                right: .1,
                child: IconButton(
                  icon: Icon(
                    EneftyIcons.bag_2_bold,
                  ),
                  onPressed: () {},
                ))
          ]),
          height: size.width * .40,
          width: size.width * .35,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imagepath), fit: BoxFit.cover),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: size.width * .35,
          child: ReadMoreText(
              style: TextStyle(
                  fontSize: size.width * .035, fontWeight: FontWeight.w600),
              trimLines: 1,
              trimMode: TrimMode.Line,
              moreStyle: TextStyle(fontSize: size.width * .02),
              lessStyle: TextStyle(fontSize: size.width * .02),
              trimCollapsedText: "Show more",
              trimExpandedText: "Show less",
              title),
        ),
        // SizedBox(
        //   width: size.width * .35,
        //   child: ReadMoreText(
        //       style: TextStyle(fontSize: 10),
        //       trimLines: 2,
        //       trimMode: TrimMode.Line,
        //       trimCollapsedText: "Show more",
        //       trimExpandedText: "Show less",
        //       description),
        // ),
        SizedBox(height: 5),
        Text(
          '\$$prize',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

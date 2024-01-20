import 'dart:developer';

import 'package:ecommerce_api/controller/store_provider.dart';
import 'package:ecommerce_api/main.dart';
import 'package:ecommerce_api/controller/wishlist_provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget topBarIcon(Size size, {required IconData icon, title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: size.width * .15,
        width: size.width * .15,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: size.width * 0.06,
        ),
      ),
      SizedBox(
        width: size.width * .15,
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      )
    ],
  );
}

Widget prodectShow(Size size, context,
    {required product,
    required String description,
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
                  onPressed: () async {
                    toWishList(context, product);
                  },
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

Future toWishList(context, product) async {
  final store = await Provider.of<StoreProvider>(context, listen: false);

  final userId = await store.getUserId();
  final token = await store.getToken('tokenId');
  // log(token);
  // log(userId);

  Provider.of<WishListProvider>(context, listen: false)
      .addToWishList(product, userId, token);
}

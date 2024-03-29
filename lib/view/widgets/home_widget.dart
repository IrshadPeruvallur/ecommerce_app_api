// ignore_for_file: sort_child_properties_last

import 'package:ecommerce_api/controller/store_provider.dart';
import 'package:ecommerce_api/controller/wishlist_provider.dart';
import 'package:ecommerce_api/view/widgets/normel_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

Widget topBarIcon(Size size, {required IconData icon, title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: size.width * .15,
        width: size.width * .15,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(10),
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
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      )
    ],
  );
}

Widget prodectShow(Size size, context,
    {product, required title, required imagepath, required prize}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(192, 255, 255, 255)),
              child: IconButton(
                icon: const Icon(
                  EneftyIcons.bag_2_outline,
                ),
                onPressed: () async {
                  toWishList(
                      context,
                      product
                          .id); // Pass product.id instead of the entire product
                },
              ),
            ),
          ),
          height: size.width * .40,
          width: size.width * .35,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(image: imagepath, fit: BoxFit.cover),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(height: 10),
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
        const SizedBox(height: 5),
        Text(
          '$prize',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Future toWishList(context, product) async {
  final store = Provider.of<StoreProvider>(context, listen: false);
  final userId = await store.getValues('userId');
  final token = await store.getValues('tokenId');
  final wishProvider = Provider.of<WishListProvider>(context, listen: false);

  if (userId != null && token != null) {
    wishProvider.addToWishList(product, userId, token);
    if (wishProvider.wishListStatuscode == '200') {
      showSuccessSnackbar(context, "Product added to Wishlist");
    } else if (wishProvider.wishListStatuscode == '500') {
      showErrorSnackbar(context, 'Product already in wishlist');
    }
  } else {
    showErrorSnackbar(context, 'Your are not loged in ');
  }
}

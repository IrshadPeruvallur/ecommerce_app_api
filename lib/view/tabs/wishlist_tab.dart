// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_api/controller/product_provider.dart';
import 'package:ecommerce_api/controller/store_provider.dart';
import 'package:ecommerce_api/controller/wishlist_provider.dart';
import 'package:ecommerce_api/view/pages/cart_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListTab extends StatelessWidget {
  const WishListTab({Key? key});

  @override
  Widget build(BuildContext context) {
    getWishList(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('Wishlist'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(EneftyIcons.bag_2_outline),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Consumer2<WishListProvider, ProductProvider>(
              builder: (context, wishList, productItem, child) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: wishList.wishListItemId.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final itemId = wishList.wishListItemId[index];
                      final product = productItem.prodectList[index];
                      final id = itemId;
                      final allProductIds = productItem.prodectList
                          .map((product) => product.id)
                          .toList();
                      if (allProductIds.contains(id)) {
                        return SizedBox(
                          width: double.infinity,
                          height: size.width * .2,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: size.width * .2,
                                      width: size.width * .2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            product.image.toString(),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.grey,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.title.toString(),
                                            style: TextStyle(
                                              fontSize: size.width * 0.04,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            product.price.toString(),
                                            style: TextStyle(
                                              fontSize: size.width * 0.04,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    EneftyIcons.close_circle_outline,
                                    size: size.width * .06,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future getWishList(context) async {
    final store = Provider.of<StoreProvider>(context, listen: false);
    final getPrvd = Provider.of<WishListProvider>(context, listen: false);
    final userId = await store.getValues('userId');
    final token = await store.getValues('tokenId');
    await getPrvd.getWishListProduct(userId, token);
  }
}

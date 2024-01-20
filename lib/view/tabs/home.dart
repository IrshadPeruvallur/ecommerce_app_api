import 'dart:developer';

import 'package:ecommerce_api/controller/data_provider.dart';
import 'package:ecommerce_api/controller/store_provider.dart';
import 'package:ecommerce_api/model/wishlist_model.dart';
import 'package:ecommerce_api/view/welcome/welcome.dart';
import 'package:ecommerce_api/view/widgets/home_widget.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getData();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () async {
                        final getStore =
                            Provider.of<StoreProvider>(context, listen: false);
                        final tokenId = await getStore.getValues('userId');
                        log(tokenId.toString());
                      },
                      icon: Icon(EneftyIcons.search_normal_2_outline)),
                  IconButton(
                      onPressed: () async {},
                      icon: Icon(EneftyIcons.bag_2_outline))
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Popular'),
                    topBarIcon(size,
                        icon: EneftyIcons.path_outline, title: 'Bed'),
                    topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Sofa'),
                    topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Table'),
                    topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Chair'),
                    topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Bed'),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Consumer<ProductProvider>(
                builder: (context, value, child) {
                  if (value.prodectList.isNotEmpty) {
                    final allProducts = value.prodectList;

                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: size.width * .05,
                          mainAxisSpacing: size.height * .06,
                        ),
                        itemCount: allProducts.length,
                        itemBuilder: (context, index) {
                          final product = allProducts[index];
                          final wishProduct = WishListModel(
                              id: product.id,
                              title: product.title,
                              description: product.description,
                              price: product.price,
                              image: product.image);
                          return prodectShow(
                            size,
                            context,
                            product: wishProduct,
                            title: product.title ?? 'Unknown',
                            description: product.description ?? '',
                            imagepath: product.image ?? '',
                            prize: product.price.toString(),
                          );
                        },
                      ),
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

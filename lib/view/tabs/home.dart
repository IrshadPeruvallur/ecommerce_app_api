import 'dart:developer';

import 'package:ecommerce_api/controller/product_provider.dart';
import 'package:ecommerce_api/controller/search_provider.dart';
import 'package:ecommerce_api/controller/store_provider.dart';
import 'package:ecommerce_api/model/wishlist_model.dart';
import 'package:ecommerce_api/view/pages/product_detail.dart';
import 'package:ecommerce_api/view/pages/cart_page.dart';
import 'package:ecommerce_api/view/widgets/home_widget.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getData();
    final serachPrvd = Provider.of<SearchProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {},
                    icon: Icon(EneftyIcons.search_normal_2_outline),
                  ),
                  SizedBox(
                      width: size.width * .6,
                      child: TextFormField(
                        onChanged: (value) => serachPrvd.search(
                            serachPrvd.searchController.text, context),
                        controller: serachPrvd.searchController,
                      )),
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ));
                    },
                    icon: Icon(EneftyIcons.bag_2_outline),
                  ),
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
              Consumer2<SearchProvider, ProductProvider>(
                builder: (context, searchValue, value, child) {
                  if (searchValue.searchedList.isEmpty) {
                    if (value.prodectList.isNotEmpty) {
                      final allProducts = value.prodectList;

                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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

                            return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        image: NetworkImage(
                                            product.image.toString()),
                                        description: product.description,
                                        title: product.title,
                                        price: product.price),
                                  )),
                              child: prodectShow(
                                size,
                                context,
                                product: wishProduct,
                                title: product.title ?? 'Unknown',
                                imagepath:
                                    NetworkImage(product.image.toString()),
                                prize: product.price.toString(),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: size.width * .05,
                            mainAxisSpacing: size.height * .06,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(),
                                  )),
                              child: prodectShow(
                                size,
                                context,
                                title: 'Dummy Product',
                                imagepath:
                                    AssetImage('assets/images/dummy.jpg'),
                                prize: '₹19999',
                              ),
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: size.width * .05,
                          mainAxisSpacing: size.height * .06,
                        ),
                        itemCount: searchValue.searchedList.length,
                        itemBuilder: (context, index) {
                          final product = searchValue.searchedList[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      image: NetworkImage(
                                          product.image.toString()),
                                      description: product.description,
                                      title: product.title,
                                      price: product.price),
                                )),
                            child: prodectShow(
                              size,
                              context,
                              title: product.title,
                              imagepath: NetworkImage(product.image.toString()),
                              prize: product.price,
                            ),
                          );
                        },
                      ),
                    );
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

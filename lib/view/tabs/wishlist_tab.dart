import 'package:ecommerce_api/view/pages/cart_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class WishListTab extends StatelessWidget {
  const WishListTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
              },
              icon: Icon(EneftyIcons.bag_2_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 15,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
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
                                        image: AssetImage(
                                            'assets/images/back.jpg'),
                                        fit: BoxFit.cover),
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Prodect Name',
                                      style: TextStyle(
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      '₹ 1999',
                                      style: TextStyle(
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.w900),
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
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

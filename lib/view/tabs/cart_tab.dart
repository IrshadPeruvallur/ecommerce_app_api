import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(EneftyIcons.shopping_cart_outline))
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
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '   Prodect Name',
                                    style: TextStyle(
                                        fontSize: size.width * 0.025,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '   ₹ 1999',
                                    style: TextStyle(
                                        fontSize: size.width * 0.03,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            EneftyIcons.add_square_outline),
                                      ),
                                      Text(
                                        "05",
                                        style: TextStyle(
                                            fontSize: size.width * 0.03,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            EneftyIcons.minus_square_outline),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(EneftyIcons.close_circle_outline)),
                            ],
                          )
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

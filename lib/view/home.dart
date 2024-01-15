import 'package:ecommerce_api/controller/data_provider.dart';
import 'package:ecommerce_api/view/widgets/home_widget.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<DataProvider>(context, listen: false).getData();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: Icon(EneftyIcons.search_normal_2_outline)),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(EneftyIcons.shopping_cart_outline))
        ],
        centerTitle: true,
        // title: Text('Make Home Beautiful'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  topBarIcon(
                    size,
                    icon: EneftyIcons.star_outline,
                  ),
                  topBarIcon(
                    size,
                    icon: EneftyIcons.path_outline,
                  ),
                  topBarIcon(
                    size,
                    icon: EneftyIcons.star_outline,
                  ),
                  topBarIcon(
                    size,
                    icon: EneftyIcons.star_outline,
                  ),
                  topBarIcon(
                    size,
                    icon: EneftyIcons.star_outline,
                  ),
                  topBarIcon(
                    size,
                    icon: EneftyIcons.star_outline,
                  ),
                ],
              ),
            ),
            Consumer<DataProvider>(
              builder: (context, value, child) {
                if (value.prodectList.isNotEmpty) {
                  final allProducts = value.prodectList;

                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        final product = allProducts[index];
                        return prodectShow(
                          size,
                          description: product.description ?? '',
                          imagepath: product.image ?? '',
                          prize: product.price.toString() ?? '0',
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
    );
  }

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
      required String imagepath,
      required String prize}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imagepath,
            height: size.width * 0.3,
          ),
          SizedBox(height: 10),
          Text(description),
          SizedBox(height: 5),
          Text('\$$prize'),
        ],
      ),
    );
  }
}

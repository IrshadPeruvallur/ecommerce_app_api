import 'package:ecommerce_api/controller/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<DataProvider>(context, listen: false).getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce App'),
      ),
      body: Center(
        child: Consumer<DataProvider>(
          builder: (context, value, child) {
            if (value.prodectList.isNotEmpty) {
              final allProducts = value.prodectList;

              return ListView.builder(
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  final product = allProducts[index];
                  return ListTile(
                    title: Text(product.title ?? ''),
                    subtitle: Text('ID: ${product.sId ?? ''}'),
                  );
                },
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}

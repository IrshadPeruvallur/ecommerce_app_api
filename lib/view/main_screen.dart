import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:ecommerce_api/controller/bottom_provider.dart';
import 'package:ecommerce_api/view/tabs/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<BottomProvider>(
      context,
    );
    return Scaffold(
      extendBody: true,
      body: getProvider.tabs[getProvider.currentIndex],
      bottomNavigationBar: DotNavigationBar(
          margin: EdgeInsets.only(left: 10, right: 10),
          onTap: (index) {
            getProvider.bottomFunction(index);
          },
          currentIndex: getProvider.currentIndex,
          dotIndicatorColor: Colors.grey[300],
          unselectedItemColor: Colors.grey[300],
          items: getProvider.items),
    );
  }
}

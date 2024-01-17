import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:ecommerce_api/view/tabs/cart_tab.dart';
import 'package:ecommerce_api/view/tabs/home.dart';
import 'package:ecommerce_api/view/tabs/profile.dart';
import 'package:ecommerce_api/view/tabs/wishlist_tab.dart';
import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int currentIndex = 0;
  dynamic items = [
    DotNavigationBarItem(
      icon: Icon(Icons.home),
      selectedColor: Color(0xff73544C),
    ),
    DotNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      selectedColor: Color(0xff73544C),
    ),
    DotNavigationBarItem(
      icon: Icon(Icons.favorite),
      selectedColor: Color(0xff73544C),
    ),
    DotNavigationBarItem(
      icon: Icon(Icons.person),
      selectedColor: Color(0xff73544C),
    ),
  ];
  final List tabs = [
    Home(),
    CartTab(),
    WishListTab(),
    ProfileTab(),
  ];
  bottomFunction(index) {
    currentIndex = index;
    notifyListeners();
  }
}

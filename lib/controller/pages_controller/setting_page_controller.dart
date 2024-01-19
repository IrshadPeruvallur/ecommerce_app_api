import 'package:ecommerce_api/view/blank_page.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool isUsernameEdit = true;
  bool isPasswordEdit = true;
  final List listTitles = [
    'FAQ',
    'Contact Us',
    'Privacy & Terms',
  ];

  final List<Widget> listTabs = [
    BlankPage(name: 'FAQ'),
    BlankPage(name: 'Contact Us'),
    BlankPage(name: 'Privacy & Terms'),
  ];

  void userNameClicked() {
    isUsernameEdit = !isUsernameEdit;
    notifyListeners();
  }

  void passwordClicked() {
    isPasswordEdit = !isPasswordEdit;
    notifyListeners();
  }
}

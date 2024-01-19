import 'package:ecommerce_api/controller/pages_controller/setting_page_controller.dart';
import 'package:ecommerce_api/view/blank_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  // bool isUsernameEdit = true;
  // bool isPasswordEdit = true;
  // final List listTitles = [
  //   'FAQ',
  //   'Contact Us',
  //   'Privacy & Terms',
  // ];

  // final List<Widget> listTabs = [
  //   BlankPage(name: 'FAQ'),
  //   BlankPage(name: 'Contact Us'),
  //   BlankPage(name: 'Privacy & Terms'),
  // ];
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<SettingsProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * .035,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // isUsernameEdit = !isUsernameEdit;
                      getProvider.userNameClicked();
                    },
                    icon: Icon(EneftyIcons.edit_2_outline),
                    iconSize: size.width * .05,
                  )
                ],
              ),
              Consumer<SettingsProvider>(builder: (context, value, child) {
                return textFormFieldBox(
                    value.isUsernameEdit, size, "Irshad", 'Username');
              }),
              SizedBox(
                height: size.width * .05,
              ),
              Consumer<SettingsProvider>(builder: (context, value, child) {
                return textFormFieldBox(
                  value.isUsernameEdit,
                  size,
                  'irshadpukayoor@gmail.com',
                  'Username',
                );
              }),
              SizedBox(
                height: size.width * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * .035,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // isPasswordEdit = !isPasswordEdit;
                      getProvider.passwordClicked();
                    },
                    icon: Icon(EneftyIcons.edit_2_outline),
                    iconSize: size.width * .05,
                  )
                ],
              ),
              Consumer<SettingsProvider>(builder: (context, value, child) {
                return textFormFieldBox(
                    value.isPasswordEdit, size, '*********', 'Password');
              }),
              SizedBox(
                height: size.width * .17,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Help Center",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * .035,
                    ),
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Material(
                  elevation: 20,
                  shadowColor: const Color.fromARGB(48, 0, 0, 0),
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => getProvider.listTabs[index],
                      ),
                    ),
                    title: Text(
                      getProvider.listTitles[index].toString().toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .035,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                        size: size.width * 0.045),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: size.width * .05,
                ),
                itemCount: 3,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textFormFieldBox(
    bool clickBool,
    Size size,
    value,
    String label, {
    controller,
    TextInputFormatter? inputFormatter,
    TextInputType? keyboardType,
  }) {
    return Material(
      elevation: 20,
      shadowColor: Color.fromARGB(77, 0, 0, 0),
      child: clickBool == true
          ? ListTile(
              title: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 53, 53, 53),
                  fontSize: size.width * .03,
                ),
              ),
              subtitle: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: size.width * .04,
                ),
              ),
            )
          : TextFormField(
              inputFormatters: inputFormatter != null ? [inputFormatter] : [],
              keyboardType: keyboardType ?? TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return " Please enter $label";
                } else {
                  return null;
                }
              },
              controller: controller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                labelText: label,
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
    );
  }
}
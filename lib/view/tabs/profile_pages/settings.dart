import 'package:ecommerce_api/controller/pages_controller/setting_page_controller.dart';
import 'package:ecommerce_api/controller/user_provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<SettingsProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
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
                    icon: const Icon(EneftyIcons.edit_2_outline),
                    iconSize: size.width * .05,
                  )
                ],
              ),
              Consumer2<SettingsProvider, UserProvider>(
                  builder: (context, value, user, child) {
                return textFormFieldBox(
                    value.isUsernameEdit,
                    size,
                    user.username.isEmpty ? 'username' : user.username,
                    'Username');
              }),
              SizedBox(
                height: size.width * .05,
              ),
              Consumer2<SettingsProvider, UserProvider>(
                  builder: (context, value, user, child) {
                return textFormFieldBox(
                  value.isUsernameEdit,
                  size,
                  user.email.isEmpty ? 'email' : user.email,
                  'email',
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
                    icon: const Icon(EneftyIcons.edit_2_outline),
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
                physics: const NeverScrollableScrollPhysics(),
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
      shadowColor: const Color.fromARGB(77, 0, 0, 0),
      child: clickBool == true
          ? ListTile(
              title: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 53, 53),
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
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                labelText: label,
                labelStyle: const TextStyle(color: Colors.black),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
    );
  }
}

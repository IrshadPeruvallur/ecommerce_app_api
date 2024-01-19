import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(EneftyIcons.logout_outline))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/profile icons.png'),
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: size.width * .03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "irshad".toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * .05,
                      ),
                    ),
                    Text(
                      "irshadpukayoor@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .04,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.width * .1,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Material(
                  elevation: 20,
                  shadowColor: Color.fromARGB(48, 0, 0, 0),
                  child: ListTile(
                    title: Text(
                      'MY ORDERS',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .04,
                      ),
                    ),
                    subtitle: Text(
                      'Notification, Password, FAQ, Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .03,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: size.width * .05,
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

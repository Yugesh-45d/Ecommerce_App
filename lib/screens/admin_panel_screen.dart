import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/helper_func.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin Panel"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primaryColor,
              ),
              width: double.maxFinite,
              height: 104,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 32,
                      child: Image.asset("assets/shop.png"),
                    ),
                    title: Text(
                      "Ram Sharma",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("Kathmandu, Nepal"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            AppFunc.myListCupertinoListTile(text: "Account Setting"),
            AppFunc.myListCupertinoListTile(text: "Download Options"),
            AppFunc.myListCupertinoListTile(text: "Notifications Setting"),
            SizedBox(
              height: 16,
            ),
            AppFunc.myListCupertinoListTile(text: "Privacy Policy"),
            AppFunc.myListCupertinoListTile(text: "Help Center"),
            AppFunc.myListCupertinoListTile(text: "About Us"),
            CupertinoListTile(
              title: Text(
                "Delete Account",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/screens/admin_panel_screen.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> pages = [
    ProductScreen(),
    SearchScreen(),
    CartScreen(),
    AdminPanelScreen(),
  ];

  getBody(int index) {
    return pages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings_outlined),
              label: "Admin Panel"),
        ],
      ),
    );
  }
}

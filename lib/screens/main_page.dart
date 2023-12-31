
import 'package:ecommerce/screens/admin_panel_screen.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;



  List<Widget> pages = [
    const ProductScreen(),
    const SearchScreen(),
    const CartScreen(),
    const AdminPanelScreen(),
  ];

  getBody(int index) {
    return pages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
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
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Shopping Cart"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings_outlined),
              label: "Admin Panel"),
        ],
      ),
    );
  }
}

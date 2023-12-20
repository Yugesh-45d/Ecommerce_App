// // ignore_for_file: prefer_const_constructors

// import 'dart:async';

// import 'package:ecommerce/screens/main_page.dart';
// import 'package:ecommerce/utilities/colors.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Timer(Duration(seconds: 2), () {
//     //   Navigator.pushReplacement(
//     //       context,
//     //       (MaterialPageRoute(builder: (context) {
//     //         return MainScreen();
//     //       })));
//     // });
//     return Scaffold(
//       backgroundColor: secondaryColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset("assets/shop.png"),
//             SizedBox(height: 24),
//             Text(
//               "Mero Pasal",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: mainColor,
//                 fontSize: 36,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:ecommerce/screens/main_page.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //       context,
    //       (MaterialPageRoute(builder: (context) {
    //         return MainScreen();
    //       })));
    // });
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/shop.png"),
            SizedBox(height: 24),
            Text(
              "Mero Pasal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: mainColor,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ecommerce",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 8,
            color: mainColor,
            centerTitle: true,
          ),
        ),
        home: const SplashScreen(),
      ),
    ),
  );
}

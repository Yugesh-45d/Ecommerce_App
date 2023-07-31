// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/screens/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce",
      home: MainScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 248, 248, 248),
          // seedColor: Colors.purple,
        ),
        useMaterial3: false,
      ),

      // theme: ThemeData.dark(),
    ),
  );
}

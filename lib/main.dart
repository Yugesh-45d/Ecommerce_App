import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 760),
        builder: (context, child) => MaterialApp(
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
    ),
  );
}

/*TODO
-Add ScreenUtil in all pages
-Create seperate widget for all the code to increase readablity
 */

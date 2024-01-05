import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFunc {
  static CupertinoListTile myListCupertinoListTile({required String text}) {
    return CupertinoListTile(
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: mainColor,
        size: 20.sp,
      ),
    );
  }
}

// To parse this JSON data, do

// final categoryModel = categoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<String> categoryModelFromJson(String str) =>
    List<String>.from(jsonDecode(str).map((x) => x));

String categoryModelToJson(List<String> data) =>
    jsonEncode(List<dynamic>.from(data.map((x) => x)));

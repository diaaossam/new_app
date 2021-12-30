import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String API_KEY = '2daa2427d8964a17acb1ca4f5f535b3d';
String BASE_URL = 'https://newsapi.org/';
String DARK_MODE = 'dark';

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => widget));
}

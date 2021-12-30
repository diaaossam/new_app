import 'package:flutter/material.dart';
import 'package:new_app/sharing/style/size_config.dart';

OutlineInputBorder buildCustomOutLineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  );
}

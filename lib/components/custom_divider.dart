import 'package:flutter/material.dart';
import 'package:new_app/sharing/style/size_config.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(8)),
      child: Container(
        width: SizeConfig.screenWidth,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}

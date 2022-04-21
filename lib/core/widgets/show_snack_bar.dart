import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/color_const.dart';

class ShowMySnackBar {
  static mySnackBar(BuildContext context, String data,
          {Color color = ColorConst.kRed}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(data),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/color_const.dart';

class ThemeComp {
  static get themeComp => ThemeData(
        colorScheme: ColorScheme.light(primary: ColorConst.kPrimaryColor),
        scaffoldBackgroundColor: ColorConst.kPrimaryScaffoldColor,
        iconTheme: IconThemeData(
          color: ColorConst.kBlack
        )
      );
}

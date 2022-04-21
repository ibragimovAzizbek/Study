import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/color_const.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  BuildContext context;
  String title;
  MyAppBar({Key? key, required this.context, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorConst.kBlack),
      title: Text(
        title,
        style: TextStyle(color: ColorConst.kBlack),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.08);
}

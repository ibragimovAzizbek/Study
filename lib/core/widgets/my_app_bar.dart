import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/providers/user_sign_provider.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  BuildContext context;
  String title;
  MyAppBar({Key? key, required this.context, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorConst.kBlack),
      actions: [
        title == 'Admin panel'
            ? IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                ),
                onPressed: () async {
                  await context.read<SignProvider>().userLogOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/cover', (route) => false);
                },
              )
            : const SizedBox()
      ],
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

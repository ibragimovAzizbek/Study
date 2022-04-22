import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/font_const.dart';

class InputUserEmail extends StatelessWidget {
  bool isShowPassword = true;

  String title;
  String hintText;
  TextEditingController controller;
  InputUserEmail(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: FontConst.kMediumFont),
          child: Text(title, textAlign: TextAlign.start),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (text) {
              if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(text!)) {
                return "Check your email and re-enter";
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}

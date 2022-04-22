import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/font_const.dart';

class InputUserPassword extends StatelessWidget {
  bool isShowPassword = true;

  String title;
  String hintText;
  TextEditingController controller;
  InputUserPassword({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

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
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            controller: controller,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (text) {
              if (text!.length < 6) {
                return "Password should`t be less than 6 characters";
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

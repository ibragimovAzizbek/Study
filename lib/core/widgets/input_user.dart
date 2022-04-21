import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/font_const.dart';

class InputUserCredintial extends StatelessWidget {
  bool isShowPassword = true;

  String title;
  String hintText;
  TextEditingController controller;
  InputUserCredintial(
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
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: controller,
            obscureText: title == 'Password' ? isShowPassword : false,
            decoration: InputDecoration(
              hintText: hintText,
              // suffixIcon: isShowPassword == true ? Icon(Icons.remove_red_eye) : Icon(Icons.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (text) {
              if (title == 'Name') {
                if (text!.isEmpty) {
                  return "Enter your name";
                }
              } else if (title == "Email") {
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(text!)) {
                  return "Check your email and re-enter";
                } else if (title == 'password') {
                  if (text.length < 6) {
                    return "Password should`t be less than 6 characters";
                  }
                } else {
                  if (title.length != 13) {
                    return "There is an error in the number";
                  }
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

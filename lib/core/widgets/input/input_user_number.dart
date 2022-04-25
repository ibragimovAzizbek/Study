import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/font_const.dart';

class InputUserNumber extends StatelessWidget {
  bool isShowPassword = true;

  String title;
  String hintText;
  TextEditingController controller;
  InputUserNumber({
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
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (number) {
              if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(number!)) {
                return "Phone number error";
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

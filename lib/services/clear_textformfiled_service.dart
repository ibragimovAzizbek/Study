import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';

class ClearTextFormFiledService {
  static clearUserData(BuildContext context) {
    Provider.of<SignProvider>(context, listen: false).nameController.clear();
    Provider.of<SignProvider>(context, listen: false).emailController.clear();
    Provider.of<SignProvider>(context, listen: false)
        .passwordController
        .clear();
    Provider.of<SignProvider>(context, listen: false)
        .phoneNumberController
        .clear();
  }
}

import 'package:flutter/material.dart';

class SignProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dataBirthController = TextEditingController();
  // Map<String, dynamic>? data;
}

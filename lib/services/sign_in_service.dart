import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/services/fire_service.dart';

class SignInService {
  // ? SIGN IN PROVIDER

  static Future<bool> signInUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FireService.auth.signInWithEmailAndPassword(
        email: Provider.of<SignProvider>(context, listen: false)
            .emailController
            .text,
        password: Provider.of<SignProvider>(context, listen: false)
            .passwordController
            .text,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

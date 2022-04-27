import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/services/fire_service.dart';

class SignUpService {
  // ? SIGN UP Provider

  static Future<bool> registerUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FireService.auth.createUserWithEmailAndPassword(
        email: Provider.of<SignProvider>(context, listen: false)
            .emailController
            .text,
        password: Provider.of<SignProvider>(context, listen: false)
            .passwordController
            .text,
      );
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'name',
        Provider.of<SignProvider>(context, listen: false).nameController.text,
      );
      await prefs.setString(
        'email',
        Provider.of<SignProvider>(context, listen: false).emailController.text,
      );
      await prefs.setString(
        'phoneNumber',
        Provider.of<SignProvider>(context, listen: false)
            .phoneNumberController
            .text,
      );
      print("SHARED PREFERENCE SUCCESS");
      FireService.store
          .collection('users')
          .doc(
            Provider.of<SignProvider>(context, listen: false)
                .emailController
                .text,
          )
          .set(
        {
          "name": Provider.of<SignProvider>(context, listen: false)
              .nameController
              .text,
          "email": Provider.of<SignProvider>(context, listen: false)
              .emailController
              .text,
          "phoneNum": Provider.of<SignProvider>(context, listen: false)
              .phoneNumberController
              .text,
          "image_url": "",
          "create_at": FieldValue.serverTimestamp(),
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

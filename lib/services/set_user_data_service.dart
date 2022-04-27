import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/services/fire_service.dart';

class SetUserData {
  // ? SetUserData

  static Future setUserData(BuildContext context) async {
    String email = Provider.of<SignProvider>(context).emailController.text;
    await FireService.store.collection('users').doc(email).set(
      {
        "image_url": FireService.storage.ref(email).getDownloadURL(),
      },
      SetOptions(
        merge: true,
      ),
    );
  }
}

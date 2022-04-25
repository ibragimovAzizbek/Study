import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/services/fire_service.dart';

class SignService {
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

  // ? User logOut

  static Future<bool> userLogOut() async {
    try {
      await FireService.auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  // ? User DATA RED FIREBASE

  static Future redUserData(BuildContext context) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> data = await FireService.store
          .collection('users')
          .doc(FireService.auth.currentUser!.email)
          .get();
      print("DATA: ${data['name']}");
      return data;
    } catch (e) {
      print("ERROR red: $e");
      // return false;
    }
  }

  static Future uploadVideo(BuildContext context) async {
    String email = Provider.of<SignProvider>(context).emailController.text;
    // await FireService.store.collection('users').doc(email).set(
    //   {
    //     "image_url": FireService.storage.ref(email).getDownloadURL(),
    //   },
    //   SetOptions(
    //     merge: true,
    //   ),
    // );
  }

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

  // Clear User Data

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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/core/widgets/show_snack_bar.dart';
import 'package:studyapp/services/fire_service.dart';

class SignProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Map<String, dynamic>? data;

  // ? SIGN IN PROVIDER

  void signInProvider(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FireService.auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowMySnackBar.mySnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ShowMySnackBar.mySnackBar(
            context, 'Wrong password provided for that user.');
      }
    }
  }

  // ? SIGN UP Provider

  void registerProvider(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FireService.auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      FireService.store.collection('users').doc(emailController.text).set(
        {
          "name": nameController.text,
          "email": emailController.text,
          "phoneNum": passwordController.text,
          "image_url": "",
          "create_at": FieldValue.serverTimestamp(),
        },
      );
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowMySnackBar.mySnackBar(
            context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ShowMySnackBar.mySnackBar(
            context, 'The account already exists for that email.');
      }
    } catch (e) {
      ShowMySnackBar.mySnackBar(context, "Something went wrong ");
    }
    notifyListeners();
  }

  // ? User DATA RED FIREBASE

  redUserProvider(BuildContext context) async {
    FireService.store
        .collection('users')
        .doc(emailController.text)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        return documentSnapshot.data() as Map<String, dynamic>;
      } else {
        ShowMySnackBar.mySnackBar(
            context, 'Document does not exist on the database');
      }
    });
  }
}

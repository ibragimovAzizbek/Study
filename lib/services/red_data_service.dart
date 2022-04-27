import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/services/fire_service.dart';

class RedUserData {
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
}

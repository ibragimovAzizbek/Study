import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/services/fire_service.dart';

class UserLessonAdd {
  static Future createCollectionLesson(BuildContext context) async {
    FireService.store
        .collection('users')
        .doc(
          Provider.of<SignProvider>(context, listen: false)
              .emailController
              .text,
        )
        .collection('lessons');
  }
}

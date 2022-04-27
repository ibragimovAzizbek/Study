import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studyapp/services/fire_service.dart';

class UploadLesson extends ChangeNotifier {
  Future uploadVedioLessonToStorage(
    XFile file, {
    required String subjectName,
    required String lessonName,
    required String unit,
    required String unitInfo,
  }) async {
    try {
      var vedio = await FireService.storage
          .ref()
          .child('subjects')
          .child(subjectName)
          .child(lessonName)
          .putFile(File(file.path));
      String downloadUrl = await vedio.ref.getDownloadURL();

      await FireService.store
          .collection('subjects')
          .doc(subjectName)
          .collection('lessons')
          .doc(lessonName)
          .set(
        {
          'unit': unit,
          'unitInfo': unitInfo,
          'vedio_url': downloadUrl,
          'create_at': FieldValue.serverTimestamp(),
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studyapp/services/fire_service.dart';

class UploadSubject {
  static Future<bool> uploadSubject(
      {required String subjectName,
      required String info,
      required String price}) async {
    try {
      FireService.store.collection('subjects').doc(subjectName).set(
        {
          'info': info,
          'price': price,
          'create_at': FieldValue.serverTimestamp(),
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

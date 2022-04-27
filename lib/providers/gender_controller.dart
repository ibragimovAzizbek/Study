import 'package:flutter/cupertino.dart';

class GenderControllerProvider extends ChangeNotifier {
  String genderController = "";

  void genderControllerProvider(String gender) {
    genderController = gender;
    notifyListeners();
  }
}

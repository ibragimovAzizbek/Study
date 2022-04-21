import 'package:flutter/cupertino.dart';

class CourseCatigoryProvider extends ChangeNotifier {
  int catigoryController = 0;
  courseCatigoryProvider(int index) {
    catigoryController = index;
    notifyListeners();
  }
}

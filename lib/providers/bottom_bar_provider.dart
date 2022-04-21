import 'package:flutter/cupertino.dart';

class BottomBarProvider extends ChangeNotifier {
  int currenetIndex = 0;

  void statusCurrentIndex(int status) {
    currenetIndex = status;
    notifyListeners();
  }
}

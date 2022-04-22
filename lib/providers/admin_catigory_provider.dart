import 'package:flutter/cupertino.dart';

class AdminPanelCatigory extends ChangeNotifier {
  int catigoryController = 0;

  adminPanelCatigory(int index) {
    catigoryController = index;
    notifyListeners();
  }
}

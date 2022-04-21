import 'package:flutter/cupertino.dart';

class CheckProvider extends ChangeNotifier {
  bool checkController = false;

  void checkProvider(bool status) {
    checkController = status;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

class CalendarIconSetProvider extends ChangeNotifier {
  int son = 0;
  void calendarIconProvider(number) {
    son = number;
    notifyListeners();
  }
}

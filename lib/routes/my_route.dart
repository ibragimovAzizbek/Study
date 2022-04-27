import 'package:flutter/material.dart';
import 'package:studyapp/screens/account/profile_page.dart';
import 'package:studyapp/screens/admin/admin_page.dart';
import 'package:studyapp/screens/catigorys/course_page.dart';
import 'package:studyapp/screens/catigorys/presences_page.dart';
import 'package:studyapp/screens/catigorys/subjects_page.dart';
import 'package:studyapp/screens/cover/cover_page.dart';
import 'package:studyapp/screens/cover/second_page.dart';
import 'package:studyapp/screens/home/home_page.dart';
import 'package:studyapp/screens/sign/sign_in_page.dart';
import 'package:studyapp/screens/sign/sign_up_page.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;

  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/admin':
        return MaterialPageRoute(builder: (_) => AdminPage());
      case '/cover':
        return MaterialPageRoute(builder: (_) => const CoverPage());
      case '/secondPage':
        return MaterialPageRoute(builder: (_) => const SecondPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/course':
        return MaterialPageRoute(builder: (_) => CoursePage());
      case '/subjects':
        return MaterialPageRoute(builder: (_) => SubjectsPage());
      case '/presences':
        return MaterialPageRoute(builder: (_) => const PresencesPage());
      case '/account0':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/account1':
        return MaterialPageRoute(builder: (_) => const PresencesPage());
      case '/account2':
        return MaterialPageRoute(builder: (_) => const PresencesPage());
      case '/account3':
        return MaterialPageRoute(builder: (_) => const PresencesPage());
    }
  }

  easyNavigate(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}

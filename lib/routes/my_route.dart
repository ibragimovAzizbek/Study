import 'package:flutter/material.dart';
import 'package:studyapp/screens/catigorys/course_page.dart';
import 'package:studyapp/screens/catigorys/presences_page.dart';
import 'package:studyapp/screens/catigorys/subjects_page.dart';
import 'package:studyapp/screens/cover/cover_page.dart';
import 'package:studyapp/screens/cover/second_page.dart';
import 'package:studyapp/screens/home/home_page.dart';
import 'package:studyapp/screens/sign/sign_in_page.dart';
import 'package:studyapp/screens/sign/sign_up_page.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
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
        return MaterialPageRoute(builder: (_) => PresencesPage());
    }
  }
}

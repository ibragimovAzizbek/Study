import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/components/theme_comp.dart';
import 'package:studyapp/providers/bottom_bar_provider.dart';
import 'package:studyapp/providers/calendar_icon_provider.dart';
import 'package:studyapp/providers/catigory_provider_course.dart';
import 'package:studyapp/providers/check_provider.dart';
import 'package:studyapp/providers/route_provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/routes/my_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => CheckProvider())),
        ChangeNotifierProvider(create: ((context) => SignProvider())),
        ChangeNotifierProvider(create: ((context) => BottomBarProvider())),
        ChangeNotifierProvider(create: ((context) => RouteProvider())),
        ChangeNotifierProvider(create: ((context) => CourseCatigoryProvider())),
        ChangeNotifierProvider(create: ((context) => CalendarIconSetProvider())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final MyRoute _myRoute = MyRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study app',
      theme: ThemeComp.themeComp,
      initialRoute: context.read<RouteProvider>().route,
      onGenerateRoute: _myRoute.onGenerateRoute,
    );
  }
}

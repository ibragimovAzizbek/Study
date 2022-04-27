import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/components/theme_comp.dart';
import 'package:studyapp/providers/admin_catigory_provider.dart';
import 'package:studyapp/providers/bottom_bar_provider.dart';
import 'package:studyapp/providers/calendar_icon_provider.dart';
import 'package:studyapp/providers/catigory_provider_course.dart';
import 'package:studyapp/providers/check_provider.dart';
import 'package:studyapp/providers/gender_controller.dart';
import 'package:studyapp/providers/route_provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/routes/my_route.dart';
import 'package:studyapp/services/admin/upload_lesson_service.dart';

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
        ChangeNotifierProvider(
            create: ((context) => CalendarIconSetProvider())),
        ChangeNotifierProvider(create: ((context) => AdminPanelCatigory())),
        ChangeNotifierProvider(create: ((context) => GenderControllerProvider())),
        ChangeNotifierProvider(create: ((context) => UploadLesson())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study app',
      theme: ThemeComp.themeComp,
      initialRoute: context.watch<RouteProvider>().route,
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}

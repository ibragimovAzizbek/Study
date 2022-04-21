import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/widgets/bodys/calendar_screen.dart';
import 'package:studyapp/core/widgets/bodys/home_screen.dart';
import 'package:studyapp/core/widgets/bodys/person_screen.dart';
import 'package:studyapp/core/widgets/bodys/screen3.dart';
import 'package:studyapp/providers/bottom_bar_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> bodys;

  @override
  void initState() {
    super.initState();
    bodys = const [
      HomeScreen(),
      CalendarScreen(),
      Screen3Page(),
      PersonAccountScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodys[context.watch<BottomBarProvider>().currenetIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          context.read<BottomBarProvider>().statusCurrentIndex(value);
        },
        currentIndex: context.watch<BottomBarProvider>().currenetIndex,
        backgroundColor: ColorConst.kTransparentColor,
        elevation: 0,
        items: items,
      ),
    );
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        label: "", icon: SvgPicture.asset('assets/icons/fi-sr-apps.svg')),
    BottomNavigationBarItem(
        label: "", icon: SvgPicture.asset('assets/icons/fi-sr-calendar.svg')),
    BottomNavigationBarItem(
        label: "", icon: SvgPicture.asset('assets/icons/bottom3.svg')),
    BottomNavigationBarItem(
        label: "", icon: SvgPicture.asset('assets/icons/fi-sr-user.svg')),
  ];
}

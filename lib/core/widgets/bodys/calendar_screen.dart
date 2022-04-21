import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/constants/path_const.dart';
import 'package:studyapp/core/constants/raduis_const.dart';
import 'package:studyapp/providers/calendar_icon_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: FontConst.kSmallFont),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Assigments",
                    style: TextStyle(
                      color: ColorConst.kBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: FontConst.kLargeFont,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Chip(
                          backgroundColor:
                              context.watch<CalendarIconSetProvider>().son == 0
                                  ? ColorConst.kPrimaryColor
                                  : ColorConst.kWhite,
                          label: const Icon(Icons.calendar_month),
                        ),
                        onTap: () {
                          context
                              .read<CalendarIconSetProvider>()
                              .calendarIconProvider(0);
                        },
                      ),
                      GestureDetector(
                        child: Chip(
                          backgroundColor:
                              context.watch<CalendarIconSetProvider>().son == 1
                                  ? ColorConst.kPrimaryColor
                                  : ColorConst.kWhite,
                          label:
                              SvgPicture.asset('assets/icons/fi-rr-list.svg'),
                        ),
                        onTap: () {
                          context
                              .read<CalendarIconSetProvider>()
                              .calendarIconProvider(1);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: TableCalendar(
                    focusedDay: DateTime(2022, 04, 21),
                    firstDay: DateTime(2000, 04, 21),
                    lastDay: DateTime(2050, 04, 21)),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConst.kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(RaduisConst.kExtraLargeRaduis),
                    topRight: Radius.circular(RaduisConst.kExtraLargeRaduis),
                  ),
                ),
                child: ListView.builder(
                  itemCount: MyPath.iconPathSubjects.length,
                  itemBuilder: ((context, index) => Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: SvgPicture.asset(
                              MyPath.iconPathSubjects[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showTaskLit(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
      ),
    );
  }
}

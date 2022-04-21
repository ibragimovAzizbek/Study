import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/widgets/my_app_bar.dart';
import 'package:studyapp/providers/catigory_provider_course.dart';

class CoursePage extends StatelessWidget {
  CoursePage({Key? key}) : super(key: key);

  List<String> subjects = ['All', 'Matemathics', 'Biology', 'English'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context, title: 'Course'),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (_, __) => Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1),
                decoration: BoxDecoration(
                    gradient: ColorConst.kContainerGradient,
                    borderRadius: BorderRadius.circular(20)),
                height: 150,
                width: 327,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: SvgPicture.asset(
                        'assets/icons/group5232.svg',
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: SvgPicture.asset(
                        'assets/icons/group5233.svg',
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Upgrade you skill and get\n  your certified Courses",
                            style: TextStyle(
                              fontSize: FontConst.kLargeFont,
                              fontWeight: FontWeight.bold,
                              color: ColorConst.kWhite,
                            ),
                          ),
                          Container(
                            height: 42,
                            width: 295,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConst.kWhite,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Go to my courses",
                                style: TextStyle(
                                  color: ColorConst.kWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.45,
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircleAvatar(radius: 3),
                CircleAvatar(radius: 4),
                CircleAvatar(radius: 3),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  color: ColorConst.kNeutral900,
                  fontSize: FontConst.kMediumFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              TextButton(
                child: Text(
                  "View all",
                  style: TextStyle(
                    color: ColorConst.kSecondPageTextColor,
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) => Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06),
                child: GestureDetector(
                  child: Chip(
                    label: Text(
                      subjects[__],
                    ),
                    backgroundColor: context
                                .watch<CourseCatigoryProvider>()
                                .catigoryController ==
                            __
                        ? ColorConst.kPrimaryColor
                        : ColorConst.kTransparentColor,
                  ),
                  onTap: () {
                    context
                        .read<CourseCatigoryProvider>()
                        .courseCatigoryProvider(__);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

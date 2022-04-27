import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:studyapp/core/components/shimmere_home_screen.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/services/red_data_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RedUserData.redUserData(context),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hi ${snapshot.data["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: FontConst.kLargeFont,
                              ),
                            ),
                            SvgPicture.asset('assets/icons/Vector.svg')
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06,
                          top: FontConst.kSmallFont,
                        ),
                        child: Text(
                          'Here is your activity today,',
                          style: TextStyle(
                            color: ColorConst.kNeutral,
                            fontWeight: FontWeight.bold,
                            fontSize: FontConst.kSmallFont,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          infoCourseContainer(
                            foiz: "89%",
                            title: "Presence",
                            colortext1: ColorConst.kWarning,
                            colortext2: ColorConst.kNeutral,
                          ),
                          infoCourseContainer(
                            foiz: "100%",
                            title: "Completeness",
                            colortext1: ColorConst.kPrimaryColor,
                            colortext2: ColorConst.kNeutral,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          infoCourseContainer(
                            foiz: "18",
                            title: "Assigments",
                            colortext1: ColorConst.kScondry,
                            colortext2: ColorConst.kNeutral,
                          ),
                          infoCourseContainer(
                            foiz: "12",
                            title: "Total Subject",
                            colortext1: ColorConst.kWarning500,
                            colortext2: ColorConst.kNeutral,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: ColorConst.kWhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            catigory(
                                context, "Course", 'assets/icons/course.svg'),
                            catigory(context, "Subjects",
                                'assets/icons/subjects.svg'),
                            catigory(
                                context, "Class", 'assets/icons/class.svg'),
                            catigory(context, "Presence",
                                'assets/icons/presence.svg'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.06),
                          child: Text(
                            "Schedule",
                            style: TextStyle(
                              color: ColorConst.kNeutral700,
                              fontWeight: FontWeight.bold,
                              fontSize: FontConst.kMediumFont,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                itemCount: 23,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, __) => Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.065,
                                    top: FontConst.kMediumFont,
                                    right: FontConst.kMediumFont,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${__ + 7}',
                                        style: TextStyle(
                                            fontSize: FontConst.kMediumFont),
                                      ),
                                      SizedBox(height: FontConst.kSmallFont),
                                      const SizedBox(
                                        height: 100,
                                        child: VerticalDivider(
                                          thickness: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              left: 33,
                              child: Container(
                                color: ColorConst.kWarning100,
                                height: 35,
                                width: 115,
                                child: Center(
                                  child: Text(
                                    "Economy",
                                    style: TextStyle(
                                      color: ColorConst.kWarning500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("ANOTHER ERROR"));
          } else {
            return Shimmer.fromColors(
              child: const NoDataForShimmer(),
              baseColor: ColorConst.kNeutral,
              highlightColor: ColorConst.kWarning,
            );
          }
        }));
  }

  Column catigory(BuildContext context, String title, String path) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: SvgPicture.asset(path),
          iconSize: 40,
          onPressed: () {
            // TODO ONPRESSED
            if (title == "Course") {
              Navigator.pushNamed(context, '/course');
            } else if (title == "Subjects") {
              Navigator.pushNamed(context, '/subjects');
            } else if (title == "Class") {
              Navigator.pushNamed(context, '/class');
            } else if (title == "Presence") {
              Navigator.pushNamed(context, '/presences');
            }
          },
        ),
        Text(
          title,
          style: TextStyle(
            color: ColorConst.kNeutral,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  // ? ??????
  Container infoCourseContainer({
    required String foiz,
    required String title,
    required Color colortext1,
    required Color colortext2,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 18),
      height: 85,
      width: 158,
      decoration: BoxDecoration(
          color: ColorConst.kWhite, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            foiz,
            style: TextStyle(
              color: colortext1,
              fontSize: FontConst.kLargeFont,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: colortext2,
              fontSize: FontConst.kSmallFont,
            ),
          ),
        ],
      ),
    );
  }
}

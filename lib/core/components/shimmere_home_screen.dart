import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';

class NoDataForShimmer extends StatelessWidget {
  const NoDataForShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      color: ColorConst.kNoDataShimmer,
                      fontWeight: FontWeight.bold,
                      fontSize: FontConst.kLargeFont,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.06,
                top: FontConst.kSmallFont,
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: ColorConst.kNoDataShimmer,
                  fontWeight: FontWeight.bold,
                  fontSize: FontConst.kSmallFont,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                info_course(),
                info_course(),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                info_course(),
                info_course(),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: Container(
          color: ColorConst.kNoDataShimmer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: ColorConst.kNoDataShimmer,
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: ColorConst.kNoDataShimmer,
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: ColorConst.kNoDataShimmer,
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: ColorConst.kNoDataShimmer,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ]);
  }

  Container info_course() {
    return Container(
      padding: const EdgeInsets.only(left: 18),
      height: 85,
      width: 158,
      decoration: BoxDecoration(
        color: ColorConst.kNoDataShimmer,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/constants/path_const.dart';
import 'package:studyapp/core/constants/raduis_const.dart';
import 'package:shimmer/shimmer.dart';

class PersonNoData extends StatelessWidget {
  PersonNoData({Key? key}) : super(key: key);

  DocumentSnapshot<Map<String, dynamic>>? user;

  List<String> names = [
    "Profile",
    "Account",
    "Settings",
    "About",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset('assets/icons/logo.svg'),
              ),
              const SizedBox(width: 10),
              Text(
                "Study",
                style: TextStyle(fontSize: FontConst.kMediumFont),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(indent: 25, endIndent: 25),
          ListTile(
            leading: CircleAvatar(
              radius: 29,
              backgroundColor: ColorConst.kWhite,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: ColorConst.kWarning,
              ),
            ),
            title: Text(
              "Welcome",
              style: TextStyle(color: ColorConst.kNeutral),
            ),
            subtitle: Shimmer.fromColors(
              child: Text(
                "",
                style: TextStyle(
                  color: ColorConst.kNeutral900,
                  fontWeight: FontWeight.bold,
                  fontSize: FontConst.kMediumFont,
                ),
              ),
              baseColor: ColorConst.kNeutral900,
              highlightColor: ColorConst.kNeutral900,
            ),
            trailing: IconButton(
              icon: CircleAvatar(
                backgroundColor: ColorConst.kNoDataShimmer,
                radius: 20,
                child: SvgPicture.asset('assets/icons/logout.svg'),
              ),
              onPressed: () {},
            ),
          ),
          const Divider(indent: 25, endIndent: 25),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundColor: ColorConst.kNoDataShimmer,
                    child: SvgPicture.asset(
                      MyPath.iconPathPersonAccount[__],
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    names[__],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.chevron_right_outlined),
                    onPressed: () {},
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/account$__');
                  },
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 327,
              height: 85,
              decoration: BoxDecoration(
                color: ColorConst.kPrimaryColor,
                borderRadius: BorderRadius.circular(
                  RaduisConst.kSmallRaduis,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/icons/help.svg'),
                  Text(
                    "How can we help you?",
                    style: TextStyle(
                      color: ColorConst.kNoDataShimmer,
                      fontSize: FontConst.kMediumFont,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Row(
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(color: ColorConst.kNeutral),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: ColorConst.kNoDataShimmer,
                    )
                  ],
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: Row(
                  children: [
                    Text('Terms', style: TextStyle(color: ColorConst.kNeutral)),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: ColorConst.kNoDataShimmer,
                    ),
                  ],
                ),
                onTap: () {
                  // showMenu(context: context, position: , items: items)
                },
              ),
              GestureDetector(
                child: Row(
                  children: [
                    Text('English',
                        style: TextStyle(color: ColorConst.kNoDataShimmer)),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: ColorConst.kNoDataShimmer,
                    ),
                  ],
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

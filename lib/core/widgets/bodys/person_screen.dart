import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/constants/path_const.dart';
import 'package:studyapp/core/constants/raduis_const.dart';
import 'package:studyapp/core/widgets/show_snack_bar.dart';
import 'package:studyapp/services/sign_service.dart';

class PersonAccountScreen extends StatefulWidget {
  const PersonAccountScreen({Key? key}) : super(key: key);

  @override
  State<PersonAccountScreen> createState() => _PersonAccountScreenState();
}

class _PersonAccountScreenState extends State<PersonAccountScreen> {
  DocumentSnapshot<Map<String, dynamic>>? user;

  List<String> names = [
    "Profile",
    "Account",
    "Settings",
    "About",
  ];

  @override
  void initState() {
    super.initState();
    SignService.redUserData(context).then(
      (value) {
        user = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            const SizedBox(height: 10),
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
              subtitle: Text(
                user!["name"],
                style: TextStyle(
                  color: ColorConst.kNeutral900,
                  fontWeight: FontWeight.bold,
                  fontSize: FontConst.kMediumFont,
                ),
              ),
              trailing: IconButton(
                icon: CircleAvatar(
                  radius: 20,
                  child: SvgPicture.asset('assets/icons/logout.svg'),
                ),
                onPressed: () async {
                  await SignService.userLogOut()
                      ? Navigator.pushNamedAndRemoveUntil(
                          context, '/cover', (route) => false)
                      : ShowMySnackBar.mySnackBar(
                          context,
                          "There is an error exiting, try again",
                        );
                },
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
                      backgroundColor: ColorConst.kScondry100,
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
                    onTap: () {},
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Center(
                child: Container(
                  width: 327,
                  height: 85,
                  decoration: BoxDecoration(
                    color: ColorConst.kScondry500,
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
                          color: ColorConst.kWhite,
                          fontSize: FontConst.kMediumFont,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
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
                        color: ColorConst.kNeutral,
                      )
                    ],
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      Text('Terms',
                          style: TextStyle(color: ColorConst.kNeutral)),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: ColorConst.kNeutral,
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
                          style: TextStyle(color: ColorConst.kNeutral)),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: ColorConst.kNeutral,
                      ),
                    ],
                  ),
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

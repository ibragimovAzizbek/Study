import 'package:flutter/material.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/image2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: ColorConst.kPrimaryGradientColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    "Find your favorite class",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FontConst.kLargeFont,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Sit enim, ac amet ultrices.",
                    style: TextStyle(
                      color: ColorConst.kSecondPageTextColor,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 4.5,
                        backgroundColor: ColorConst.kButtonColor,
                      ),
                      const SizedBox(width: 5),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: ColorConst.kButtonColor,
                      ),
                      const SizedBox(width: 5),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: ColorConst.kButtonColor,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: FontConst.kSmallFont),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ? Bosilganda bu qisimni o'tkazib yuborilson
            TextButton(
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: FontConst.kMediumFont,
                  color: ColorConst.kButtonColor,
                ),
              ),
              onPressed: () {},
            ),
            // ! Bosilganida class haqida ma'lumotlar almashishi kerak
            FloatingActionButton(
              backgroundColor: ColorConst.kButtonColor,
              child: Icon(
                Icons.arrow_right_alt_sharp,
                color: ColorConst.kWhite,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}

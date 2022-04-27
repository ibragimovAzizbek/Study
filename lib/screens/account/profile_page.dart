import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/widgets/bodys/person_screen.dart';
import 'package:studyapp/core/widgets/input/input_date_of_birth.dart';
import 'package:studyapp/core/widgets/input/input_user_email.dart';
import 'package:studyapp/core/widgets/input/input_user_name.dart';
import 'package:studyapp/core/widgets/input/input_user_number.dart';
import 'package:studyapp/providers/gender_controller.dart';
import 'package:studyapp/providers/user_sign_provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  TextEditingController nameController =
      TextEditingController(text: PersonAccountScreen.name);
  TextEditingController emailController =
      TextEditingController(text: PersonAccountScreen.email);
  TextEditingController phoneNumberController =
      TextEditingController(text: PersonAccountScreen.phoneNumber);

  String genderController = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.kTransparentColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorConst.kBlack),
        title: Text(
          "Profil",
          style: TextStyle(
            color: ColorConst.kBlack,
            fontSize: FontConst.kMediumFont,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: ColorConst.kWhite,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorConst.kWarning,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: ColorConst.kWhite,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: ColorConst.kPrimaryColor,
                            child: SvgPicture.asset(
                              'assets/icons/camera.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          print("object");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              InputUserName(
                controller: context.watch<SignProvider>().nameController,
                hintText: "",
                title: "Name",
              ),
              InputUserEmail(
                controller: context.watch<SignProvider>().emailController,
                title: "Email",
                hintText: "",
              ),
              InputDataOfBirth(
                title: "Data of birth",
                hintText: "dd/mm/yy",
                controller: context.watch<SignProvider>().dataBirthController,
              ),
              InputUserNumber(
                title: "Number",
                hintText: "",
                controller: context.watch<SignProvider>().phoneNumberController,
              ),
              titleName(context, "Student ID"),
              SizedBox(height: FontConst.kMediumFont),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                    color: ColorConst.kNeutral300,
                    border: Border.all(
                      color: ColorConst.kNeutral,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18, left: 10),
                  child: Text(
                    "#${Random(100000).nextInt(999999)}",
                    style: TextStyle(color: ColorConst.kNeutral700),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: FontConst.kSmallFont),
              titleName(context, "Gender"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  gender(context, "Male"),
                  gender(context, "Female"),
                ],
              ),
              const SizedBox(height: 15),
              titleName(context, "Address"),
              const SizedBox(height: 15),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConst.kNeutral),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  child: Text(
                    "Update Profil",
                    style: TextStyle(
                      color: ColorConst.kWhite,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.8,
                      MediaQuery.of(context).size.height * 0.08,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector gender(BuildContext context, String gender) {
    String data =
        Provider.of<GenderControllerProvider>(context).genderController;
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
            color: ColorConst.kTransparentColor,
            border: Border.all(color: ColorConst.kNeutral300),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: data != gender
                  ? ColorConst.kPrimaryColor.withOpacity(0.15)
                  : ColorConst.kPrimaryColor,
              child: data == gender
                  ? Image.asset('assets/icons/Line2.png')
                  : const SizedBox(),
            ),
            Text(
              gender,
              style: TextStyle(
                color: ColorConst.kNeutral900,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        context
            .read<GenderControllerProvider>()
            .genderControllerProvider(gender);
      },
    );
  }

  Padding titleName(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      child: Text(title),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/services/sign_service.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // ? Image box
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/IMAGE.png',
                fit: BoxFit.cover,
              ),
            ),
            // ? Another color and button
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: ColorConst.kPrimaryGradientColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ? LOGO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: FontConst.kExtraLargeFont,
                          width: FontConst.kExtraLargeFont,
                          child: SvgPicture.asset(
                            'assets/icons/logo.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        Text(
                          "Study",
                          style: TextStyle(
                            fontSize: FontConst.kLargeFont,
                            color: ColorConst.kWhite,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.55),
                    // ? Text
                    Text(
                      "\t\t\t\tHello and\nwelcome here!",
                      style: TextStyle(
                        fontSize: 35,
                        color: ColorConst.kWhite,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    AutoSizeText(
                      "Get an overview of how you are performing\nand motivate yourself to achieve even moew.",
                      style: TextStyle(
                        fontSize: FontConst.kSmallFont,
                        color: ColorConst.kWhite.withOpacity(0.5),
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    //? Button let's start
                    ElevatedButton(
                      child: AutoSizeText(
                        "Let’s Start",
                        style: TextStyle(
                          color: ColorConst.kWhite,
                          fontSize: FontConst.kMediumFont,
                        ),
                        maxLines: 1,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: ColorConst.kButtonColor,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.5,
                          MediaQuery.of(context).size.height * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(FontConst.kSmallFont),
                        ),
                      ),
                      onPressed: () async {
                        await SignService.clearUserData(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/secondPage', (route) => false);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

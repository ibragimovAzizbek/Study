import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/widgets/input/input_user_email.dart';
import 'package:studyapp/core/widgets/input/input_user_name.dart';
import 'package:studyapp/core/widgets/input/input_user_number.dart';
import 'package:studyapp/core/widgets/input/input_user_password.dart';
import 'package:studyapp/core/widgets/my_app_bar.dart';
import 'package:studyapp/core/widgets/show_snack_bar.dart';
import 'package:studyapp/providers/check_provider.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/services/sign_up_service.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context, title: "Sign Up"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Form(
              key: formKey,
              child: Column(
                children: [
                  InputUserName(
                    title: "Name",
                    hintText: "Your name",
                    controller: context.watch<SignProvider>().nameController,
                  ),
                  SizedBox(height: FontConst.kMediumFont),
                  InputUserEmail(
                    title: "Email",
                    hintText: "study@email.com",
                    controller: context.watch<SignProvider>().emailController,
                  ),
                  InputUserPassword(
                    title: "Password",
                    hintText: "Your password",
                    controller:
                        context.watch<SignProvider>().passwordController,
                  ),
                  InputUserNumber(
                    title: "Phone number",
                    hintText: "+998 xx xxx xx xx",
                    controller:
                        context.watch<SignProvider>().phoneNumberController,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Checkbox(
                    value: context.watch<CheckProvider>().checkController,
                    onChanged: (status) {
                      context.read<CheckProvider>().checkProvider(status!);
                    },
                  ),
                ),
                AutoSizeText(
                  "I agree with the terms and conditions and\nalso the protection of my personal\ndata on this application",
                  style: TextStyle(color: ColorConst.kSecondPageTextColor),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            ElevatedButton(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: FontConst.kLargeFont,
                  color: ColorConst.kWhite,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorConst.kButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.08,
                ),
              ),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (Provider.of<CheckProvider>(context, listen: false)
                      .checkController) {
                    await SignUpService.registerUser(context) == true
                        ? Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => false)
                        : ShowMySnackBar.mySnackBar(
                            context, "There is an error registering");
                  } else {
                    ShowMySnackBar.mySnackBar(context, 'Agree to the terms.');
                  }
                }
              },
            ),
            TextButton(
              child: Text(
                "Login account",
                style: TextStyle(color: ColorConst.kButtonColor),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
            ),
          ],
        ),
      ),
    );
  }
}

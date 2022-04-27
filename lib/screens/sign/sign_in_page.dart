import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/widgets/input/input_user_email.dart';
import 'package:studyapp/core/widgets/input/input_user_password.dart';
import 'package:studyapp/core/widgets/my_app_bar.dart';
import 'package:studyapp/core/widgets/show_snack_bar.dart';
import 'package:studyapp/providers/user_sign_provider.dart';
import 'package:studyapp/services/sign_in_service.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context, title: "Sign In"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Form(
                key: formKeySignIn,
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.6),
                child: TextButton(
                  child: const Text('Forgot Password?'),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              ElevatedButton(
                child: Text(
                  "Login In",
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
                onLongPress: () {
                  if (formKeySignIn.currentState!.validate()) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/admin', (route) => false);
                  }
                },
                onPressed: () async {
                  if (formKeySignIn.currentState!.validate()) {
                    await SignInService.signInUser(context) == true
                        ? Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => false)
                        : ShowMySnackBar.mySnackBar(
                            context, "There is an error logging in");
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have on account?"),
                  TextButton(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: ColorConst.kButtonColor),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: Lottie.asset('assets/animation/signin.json'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

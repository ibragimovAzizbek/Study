import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:studyapp/core/widgets/my_appbar.dart';

class PresencesPage extends StatelessWidget {
  const PresencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context, title: "Presences"),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset(
                'assets/animation/no_data.json',
              ),
            ),
          )
        ],
      ),
    );
  }
}
